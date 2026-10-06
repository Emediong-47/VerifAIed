import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/application/liveness/liveness_bloc.dart';
import 'package:verif_aled/features/verification/application/liveness_voice/liveness_voice_prompts.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';
import 'package:verif_aled/features/verification/domain/objects/liveness_check_object.dart';

void main() {
  const challenges = [LivenessAction.lookLeft, LivenessAction.lookRight];
  const fresh = LivenessCheck(challenges: challenges);
  final oneDone = fresh.complete();
  final allDone = oneDone.complete();

  const starting = LivenessState(status: LivenessStatus.starting);
  const firstChallenge = LivenessState(
    status: LivenessStatus.inProgress,
    check: fresh,
  );
  final secondChallenge = LivenessState(
    status: LivenessStatus.inProgress,
    check: oneDone,
  );
  final holdingStill = LivenessState(
    status: LivenessStatus.holdingStill,
    check: allDone,
  );

  VoicePrompt? between(LivenessState previous, LivenessState current) =>
      LivenessVoicePrompts.between(previous, current);

  test('the first challenge is introduced', () {
    // Arrange & Act
    final prompt = between(starting, firstChallenge);

    // Assert
    expect(prompt, (
      text: "Let's check it's really you. Look left.",
      isGuidance: false,
    ));
  });

  test('a completed challenge connects to the next one', () {
    // Arrange & Act
    final prompt = between(firstChallenge, secondChallenge);

    // Assert
    expect(prompt, (text: 'Good job, now look right.', isGuidance: false));
  });

  test('the last challenge connects to holding still', () {
    // Arrange & Act
    final prompt = between(secondChallenge, holdingStill);

    // Assert
    expect(prompt, (
      text: 'Great, now look straight at the camera and hold still.',
      isGuidance: false,
    ));
  });

  test('connectors vary from step to step and wrap around', () {
    // Arrange
    final count = LivenessVoicePrompts.connectors.length;

    // Act
    final openers = [
      for (var completed = 1; completed <= count + 1; completed++)
        LivenessVoicePrompts.connector(completed),
    ];

    // Assert
    expect(openers.take(count).toSet(), hasLength(count));
    expect(openers.last, openers.first);
  });

  test('every action has a spoken instruction', () {
    // Arrange & Act
    final spoken = {
      for (final action in LivenessAction.values)
        action: LivenessVoicePrompts.instruction(action),
    };

    // Assert
    expect(spoken, {
      LivenessAction.lookLeft: 'look left',
      LivenessAction.lookRight: 'look right',
      LivenessAction.lookUp: 'look up',
      LivenessAction.lookDown: 'look down',
      LivenessAction.smile: 'smile',
    });
  });

  test('a different face restarts with the first challenge', () {
    // Arrange
    final restarted = firstChallenge.copyWith(
      guidance: FaceGuidance.faceChanged,
    );

    // Act
    final prompt = between(holdingStill, restarted);

    // Assert
    expect(prompt, (
      text: "A different face was detected. Let's start again. Look left.",
      isGuidance: false,
    ));
  });

  test('completing the check says thank you', () {
    // Arrange
    final completed = holdingStill.copyWith(status: LivenessStatus.completed);

    // Act
    final prompt = between(holdingStill, completed);

    // Assert
    expect(prompt, (text: 'All done. Thank you.', isGuidance: false));
  });

  test('a failure asks the user to try again', () {
    // Arrange
    const failed = LivenessState(status: LivenessStatus.failure);

    // Act
    final prompt = between(starting, failed);

    // Assert
    expect(prompt?.text, 'Something went wrong. Please try again.');
  });

  final guidance = <(FaceGuidance, String)>[
    (FaceGuidance.noFace, 'Position your face in the frame.'),
    (FaceGuidance.multipleFaces, 'Only one face should be visible.'),
    (FaceGuidance.faceCamera, 'Face the camera.'),
    (FaceGuidance.moveCloser, 'Move a little closer.'),
    (FaceGuidance.moveBack, 'Move back a little.'),
    (FaceGuidance.centreFace, 'Centre your face in the oval.'),
  ];

  for (final (face, text) in guidance) {
    test('${face.name} guidance is spoken as guidance', () {
      // Arrange
      final current = holdingStill.copyWith(guidance: face);

      // Act
      final prompt = between(holdingStill, current);

      // Assert
      expect(prompt, (text: text, isGuidance: true));
    });
  }

  test('fixing the position while holding still says hold still', () {
    // Arrange
    final tooFar = holdingStill.copyWith(guidance: FaceGuidance.moveCloser);

    // Act
    final prompt = between(tooFar, holdingStill);

    // Assert
    expect(prompt, (text: 'Hold still.', isGuidance: true));
  });

  test('finding the face again repeats the current challenge', () {
    // Arrange
    final lost = secondChallenge.copyWith(guidance: FaceGuidance.noFace);

    // Act
    final prompt = between(lost, secondChallenge);

    // Assert
    expect(prompt, (text: 'Look right.', isGuidance: true));
  });

  test('frame-by-frame progress says nothing', () {
    // Arrange
    final holding = firstChallenge.copyWith(matchingFrames: 2);

    // Act
    final prompt = between(firstChallenge, holding);

    // Assert
    expect(prompt, isNull);
  });

  test('starting the camera says nothing yet', () {
    // Arrange & Act
    final prompt = between(const LivenessState(), starting);

    // Assert
    expect(prompt, isNull);
  });
}
