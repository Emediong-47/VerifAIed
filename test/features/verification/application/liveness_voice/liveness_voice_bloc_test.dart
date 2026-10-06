import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/utils/clock.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/application/liveness/liveness_bloc.dart';
import 'package:verif_aled/features/verification/application/liveness_voice/liveness_voice_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';
import 'package:verif_aled/features/verification/domain/objects/liveness_check_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_tracking_repository.dart';
import 'package:verif_aled/features/verification/domain/repositories/speech_repository.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_challenge_generator.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_evaluator.dart';

class MockSpeechRepository extends Mock implements SpeechRepository {}

class MockFaceTrackingRepository extends Mock
    implements FaceTrackingRepository {}

class MockLivenessChallengeGenerator extends Mock
    implements LivenessChallengeGenerator {}

class ManualClock extends Clock {
  ManualClock(this.current);

  DateTime current;

  @override
  DateTime now() => current;
}

void main() {
  const check = LivenessCheck(
    challenges: [LivenessAction.lookLeft, LivenessAction.smile],
  );
  const starting = LivenessState(status: LivenessStatus.starting);
  const inProgress = LivenessState(
    status: LivenessStatus.inProgress,
    check: check,
  );

  late MockSpeechRepository speech;
  late ManualClock clock;
  late LivenessVoiceBloc bloc;

  setUp(() {
    speech = MockSpeechRepository();
    when(() => speech.speak(any())).thenAnswer((_) async {});
    when(() => speech.stop()).thenAnswer((_) async {});
    clock = ManualClock(DateTime(2026, 10, 6, 9));
    bloc = LivenessVoiceBloc(speech, clock);
  });

  tearDown(() => bloc.close());

  Future<void> report(LivenessState state) async {
    bloc.add(LivenessVoiceEvent.livenessChanged(state));
    await Future<void>.delayed(Duration.zero);
  }

  List<String> spoken() =>
      verify(() => speech.speak(captureAny())).captured.cast<String>();

  test('speaks the prompt for a liveness change', () async {
    // Arrange
    await report(starting);

    // Act
    await report(inProgress);

    // Assert
    expect(spoken(), ["Let's check it's really you. Look left."]);
    expect(bloc.state.lastSpoken, "Let's check it's really you. Look left.");
  });

  test('stays quiet when there is nothing to say', () async {
    // Arrange
    await report(starting);

    // Act
    await report(starting.copyWith(matchingFrames: 1));

    // Assert
    verifyNever(() => speech.speak(any()));
  });

  test('guidance is not repeated within the guidance interval', () async {
    // Arrange
    await report(inProgress);
    clearInteractions(speech);
    await report(inProgress.copyWith(guidance: FaceGuidance.noFace));

    // Act
    clock.current = clock.current.add(const Duration(milliseconds: 500));
    await report(inProgress.copyWith(guidance: FaceGuidance.multipleFaces));

    // Assert
    expect(spoken(), ['Position your face in the frame.']);
  });

  test('guidance is spoken again once the interval has passed', () async {
    // Arrange
    await report(inProgress);
    clearInteractions(speech);
    await report(inProgress.copyWith(guidance: FaceGuidance.noFace));

    // Act
    clock.current = clock.current.add(LivenessVoiceBloc.guidanceInterval);
    await report(inProgress.copyWith(guidance: FaceGuidance.multipleFaces));

    // Assert
    expect(spoken(), [
      'Position your face in the frame.',
      'Only one face should be visible.',
    ]);
  });

  test('step prompts are never held back by recent guidance', () async {
    // Arrange
    await report(inProgress.copyWith(guidance: FaceGuidance.noFace));
    clearInteractions(speech);
    await report(inProgress);
    clearInteractions(speech);

    // Act
    await report(inProgress.copyWith(check: check.complete()));

    // Assert
    expect(spoken(), ['Good job, now smile.']);
  });

  test('muting stops speech and silences later prompts', () async {
    // Arrange
    await report(starting);

    // Act
    bloc.add(const LivenessVoiceEvent.muteToggled());
    await Future<void>.delayed(Duration.zero);
    await report(inProgress);

    // Assert
    expect(bloc.state.muted, isTrue);
    verify(() => speech.stop()).called(1);
    verifyNever(() => speech.speak(any()));
  });

  test('unmuting speaks the next prompt', () async {
    // Arrange
    bloc
      ..add(const LivenessVoiceEvent.muteToggled())
      ..add(const LivenessVoiceEvent.muteToggled());
    await Future<void>.delayed(Duration.zero);
    await report(starting);

    // Act
    await report(inProgress);

    // Assert
    expect(bloc.state.muted, isFalse);
    expect(spoken(), ["Let's check it's really you. Look left."]);
  });

  test('a full liveness check is announced step by step', () async {
    // Arrange
    final tracking = MockFaceTrackingRepository();
    final generator = MockLivenessChallengeGenerator();
    final faces = StreamController<List<FaceObservation>>.broadcast();
    when(() => generator.generate()).thenReturn(check.challenges);
    when(() => tracking.start()).thenAnswer((_) async => const Ok(null));
    when(() => tracking.faces).thenAnswer((_) => faces.stream);
    when(() => tracking.stop()).thenAnswer((_) async {});
    when(
      () => tracking.captureSelfie(),
    ).thenAnswer((_) async => const Ok(DocumentImage(path: '/tmp/selfie.jpg')));
    final liveness = LivenessBloc(
      tracking,
      const LivenessEvaluator(),
      generator,
    );
    final forwarding = liveness.stream.listen(
      (state) => bloc.add(LivenessVoiceEvent.livenessChanged(state)),
    );
    Future<void> frames(FaceObservation face, int times) async {
      for (var i = 0; i < times; i++) {
        faces.add([face]);
        await Future<void>.delayed(Duration.zero);
      }
    }

    // Act
    liveness.add(const LivenessEvent.started());
    await Future<void>.delayed(Duration.zero);
    await frames(
      const FaceObservation(yaw: 40, pitch: 0, trackingId: 1),
      LivenessEvaluator.requiredFrames,
    );
    await frames(
      const FaceObservation(
        yaw: 0,
        pitch: 0,
        smilingProbability: 0.95,
        trackingId: 1,
      ),
      LivenessEvaluator.requiredFrames,
    );
    await frames(
      const FaceObservation(
        yaw: 0,
        pitch: 0,
        trackingId: 1,
        centerX: 0.5,
        centerY: 0.5,
        faceWidth: 0.45,
      ),
      LivenessEvaluator.requiredStillFrames,
    );
    await Future<void>.delayed(Duration.zero);

    // Assert
    expect(liveness.state.status, LivenessStatus.completed);
    expect(spoken(), [
      "Let's check it's really you. Look left.",
      'Good job, now smile.',
      'Great, now look straight at the camera and hold still.',
      'All done. Thank you.',
    ]);
    await forwarding.cancel();
    await liveness.close();
    await faces.close();
  });
}
