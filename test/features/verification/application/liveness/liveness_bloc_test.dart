import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/application/liveness/liveness_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';
import 'package:verif_aled/features/verification/domain/objects/liveness_check_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_tracking_repository.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_challenge_generator.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_evaluator.dart';

class MockFaceTrackingRepository extends Mock
    implements FaceTrackingRepository {}

class MockLivenessChallengeGenerator extends Mock
    implements LivenessChallengeGenerator {}

void main() {
  const challenges = [LivenessAction.lookLeft, LivenessAction.smile];
  const selfie = DocumentImage(path: '/tmp/selfie.jpg');
  const neutral = FaceObservation(yaw: 0, pitch: 0, trackingId: 1);
  const lookingLeft = FaceObservation(yaw: 40, pitch: 0, trackingId: 1);
  const smiling = FaceObservation(
    yaw: 0,
    pitch: 0,
    smilingProbability: 0.95,
    trackingId: 1,
  );
  // Facing the camera, centred and at a good distance.
  const wellPlaced = FaceObservation(
    yaw: 0,
    pitch: 0,
    trackingId: 1,
    centerX: 0.5,
    centerY: 0.5,
    faceWidth: 0.45,
  );

  late MockFaceTrackingRepository repository;
  late MockLivenessChallengeGenerator generator;
  late StreamController<List<FaceObservation>> faces;
  late LivenessBloc bloc;

  setUp(() {
    repository = MockFaceTrackingRepository();
    generator = MockLivenessChallengeGenerator();
    faces = StreamController<List<FaceObservation>>.broadcast();

    when(() => generator.generate()).thenReturn(challenges);
    when(() => repository.start()).thenAnswer((_) async => const Ok(null));
    when(() => repository.faces).thenAnswer((_) => faces.stream);
    when(
      () => repository.captureSelfie(),
    ).thenAnswer((_) async => const Ok(selfie));
    when(() => repository.stop()).thenAnswer((_) async {});

    bloc = LivenessBloc(repository, const LivenessEvaluator(), generator);
  });

  tearDown(() async {
    await bloc.close();
    await faces.close();
  });

  Future<void> settle() => Future<void>.delayed(Duration.zero);

  Future<void> start() async {
    bloc.add(const LivenessEvent.started());
    await settle();
  }

  Future<void> sendFrames(List<FaceObservation> frame, {int times = 1}) async {
    for (var i = 0; i < times; i++) {
      faces.add(frame);
      await settle();
    }
  }

  Future<void> completeChallenges() async {
    await start();
    await sendFrames([lookingLeft], times: LivenessEvaluator.requiredFrames);
    await sendFrames([smiling], times: LivenessEvaluator.requiredFrames);
  }

  test('initial state is initial', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state, const LivenessState());
  });

  test(
    'started emits starting then in progress with generated challenges',
    () async {
      // Arrange
      final expectation = expectLater(
        bloc.stream,
        emitsInOrder(const [
          LivenessState(status: LivenessStatus.starting),
          LivenessState(
            status: LivenessStatus.inProgress,
            check: LivenessCheck(challenges: challenges),
          ),
        ]),
      );

      // Act
      bloc.add(const LivenessEvent.started());

      // Assert
      await expectation;
      verify(() => repository.start()).called(1);
    },
  );

  test('camera failure emits failure', () async {
    // Arrange
    when(
      () => repository.start(),
    ).thenAnswer((_) async => const Err(CameraFailure('No front camera')));

    // Act
    await start();

    // Assert
    expect(bloc.state.status, LivenessStatus.failure);
    expect(bloc.state.failure, isA<CameraFailure>());
  });

  test('no face asks the user to position their face', () async {
    // Arrange
    await start();

    // Act
    await sendFrames([]);

    // Assert
    expect(bloc.state.guidance, FaceGuidance.noFace);
  });

  test('several faces asks for only one face', () async {
    // Arrange
    await start();

    // Act
    await sendFrames([neutral, neutral]);

    // Assert
    expect(bloc.state.guidance, FaceGuidance.multipleFaces);
  });

  test('a challenge is not completed before the required frames', () async {
    // Arrange
    await start();

    // Act
    await sendFrames([
      lookingLeft,
    ], times: LivenessEvaluator.requiredFrames - 1);

    // Assert
    expect(bloc.state.check!.completedChallenges, isEmpty);
    expect(bloc.state.matchingFrames, LivenessEvaluator.requiredFrames - 1);
  });

  test('holding the challenge for the required frames completes it', () async {
    // Arrange
    await start();

    // Act
    await sendFrames([lookingLeft], times: LivenessEvaluator.requiredFrames);

    // Assert
    expect(bloc.state.check!.completedChallenges, [LivenessAction.lookLeft]);
    expect(bloc.state.check!.currentChallenge, LivenessAction.smile);
    expect(bloc.state.matchingFrames, 0);
  });

  test('a non-matching frame resets the matching frame count', () async {
    // Arrange
    await start();
    await sendFrames([
      lookingLeft,
    ], times: LivenessEvaluator.requiredFrames - 1);

    // Act
    await sendFrames([neutral]);

    // Assert
    expect(bloc.state.matchingFrames, 0);
    expect(bloc.state.check!.completedChallenges, isEmpty);
  });

  test('the wrong action does not complete the current challenge', () async {
    // Arrange
    await start();

    // Act
    await sendFrames([smiling], times: LivenessEvaluator.requiredFrames);

    // Assert
    expect(bloc.state.check!.completedChallenges, isEmpty);
  });

  test('a different face restarts the challenges', () async {
    // Arrange
    await start();
    await sendFrames([lookingLeft], times: LivenessEvaluator.requiredFrames);

    // Act
    await sendFrames([neutral.copyWith(trackingId: 2)]);

    // Assert
    expect(bloc.state.check!.completedChallenges, isEmpty);
    expect(bloc.state.guidance, FaceGuidance.faceChanged);
    expect(bloc.state.trackingId, 2);
  });

  test('completing every challenge asks the user to hold still', () async {
    // Arrange
    await start();
    await sendFrames([lookingLeft], times: LivenessEvaluator.requiredFrames);

    // Act
    await sendFrames([smiling], times: LivenessEvaluator.requiredFrames);

    // Assert
    expect(bloc.state.status, LivenessStatus.holdingStill);
    expect(bloc.state.check!.isComplete, isTrue);
    expect(bloc.state.matchingFrames, 0);
    verifyNever(() => repository.captureSelfie());
  });

  test('holding a well-placed face still captures the selfie', () async {
    // Arrange
    await completeChallenges();
    final statuses = <LivenessStatus>[];
    final subscription = bloc.stream.listen((s) => statuses.add(s.status));

    // Act
    await sendFrames([
      wellPlaced,
    ], times: LivenessEvaluator.requiredStillFrames);

    // Assert
    expect(
      statuses,
      containsAllInOrder([LivenessStatus.capturing, LivenessStatus.completed]),
    );
    expect(bloc.state.selfie, selfie);
    verify(() => repository.captureSelfie()).called(1);
    await subscription.cancel();
  });

  test('the selfie waits for the required still frames', () async {
    // Arrange
    await completeChallenges();

    // Act
    await sendFrames([
      wellPlaced,
    ], times: LivenessEvaluator.requiredStillFrames - 1);

    // Assert
    expect(bloc.state.status, LivenessStatus.holdingStill);
    expect(
      bloc.state.matchingFrames,
      LivenessEvaluator.requiredStillFrames - 1,
    );
    verifyNever(() => repository.captureSelfie());
  });

  final positionGuidance = <(String, FaceObservation, FaceGuidance)>[
    ('still turned', wellPlaced.copyWith(yaw: 30), FaceGuidance.faceCamera),
    (
      'too far away',
      wellPlaced.copyWith(faceWidth: 0.1),
      FaceGuidance.moveCloser,
    ),
    ('too close', wellPlaced.copyWith(faceWidth: 0.9), FaceGuidance.moveBack),
    ('off centre', wellPlaced.copyWith(centerX: 0.8), FaceGuidance.centreFace),
  ];

  for (final (description, face, guidance) in positionGuidance) {
    test(
      'a face $description while holding still is guided and not captured',
      () async {
        // Arrange
        await completeChallenges();
        await sendFrames([
          wellPlaced,
        ], times: LivenessEvaluator.requiredStillFrames - 1);

        // Act
        await sendFrames([face]);

        // Assert
        expect(bloc.state.guidance, guidance);
        expect(bloc.state.matchingFrames, 0);
        expect(bloc.state.status, LivenessStatus.holdingStill);
        verifyNever(() => repository.captureSelfie());
      },
    );
  }

  test('losing the face while holding still resets the count', () async {
    // Arrange
    await completeChallenges();
    await sendFrames([wellPlaced], times: 2);

    // Act
    await sendFrames([]);

    // Assert
    expect(bloc.state.guidance, FaceGuidance.noFace);
    expect(bloc.state.matchingFrames, 0);
    expect(bloc.state.status, LivenessStatus.holdingStill);
  });

  test(
    'a different face while holding still restarts the challenges',
    () async {
      // Arrange
      await completeChallenges();

      // Act
      await sendFrames([wellPlaced.copyWith(trackingId: 2)]);

      // Assert
      expect(bloc.state.status, LivenessStatus.inProgress);
      expect(bloc.state.check!.completedChallenges, isEmpty);
      expect(bloc.state.guidance, FaceGuidance.faceChanged);
    },
  );

  test('a failed selfie capture emits failure', () async {
    // Arrange
    when(
      () => repository.captureSelfie(),
    ).thenAnswer((_) async => const Err(CameraFailure('capture failed')));
    await completeChallenges();

    // Act
    await sendFrames([
      wellPlaced,
    ], times: LivenessEvaluator.requiredStillFrames);

    // Assert
    expect(bloc.state.status, LivenessStatus.failure);
    expect(bloc.state.failure?.message, 'capture failed');
  });

  test('frames after completion are ignored', () async {
    // Arrange
    await completeChallenges();
    await sendFrames([
      wellPlaced,
    ], times: LivenessEvaluator.requiredStillFrames);
    final completed = bloc.state;

    // Act
    await sendFrames([]);

    // Assert
    expect(bloc.state, completed);
    verify(() => repository.captureSelfie()).called(1);
  });

  test('closing the bloc stops the camera', () async {
    // Arrange
    await start();

    // Act
    await bloc.close();

    // Assert
    verify(() => repository.stop()).called(1);
  });
}
