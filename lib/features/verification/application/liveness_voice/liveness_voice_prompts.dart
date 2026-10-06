import 'package:verif_aled/features/verification/application/liveness/liveness_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';

/// Something to say to the user. Guidance prompts react to the face moving
/// around, so they are rate-limited; step prompts are always spoken.
typedef VoicePrompt = ({String text, bool isGuidance});

/// Decides what to say when the liveness check moves from one state to the
/// next.
abstract final class LivenessVoicePrompts {
  /// Varied openers, so consecutive steps do not sound robotic.
  static const connectors = [
    'Good job, now',
    'Great, now',
    'Nice one, now',
    'Perfect, now',
  ];

  static const holdStill = 'look straight at the camera and hold still';

  static String instruction(LivenessAction action) => switch (action) {
    LivenessAction.lookLeft => 'look left',
    LivenessAction.lookRight => 'look right',
    LivenessAction.lookUp => 'look up',
    LivenessAction.lookDown => 'look down',
    LivenessAction.smile => 'smile',
  };

  /// The connector after the [completed]th challenge (1-based).
  static String connector(int completed) =>
      connectors[(completed - 1) % connectors.length];

  static VoicePrompt? between(LivenessState previous, LivenessState current) {
    final statusChanged = previous.status != current.status;
    final completed = current.check?.completedChallenges.length ?? 0;
    final previousCompleted = previous.check?.completedChallenges.length ?? 0;
    final next = current.check?.currentChallenge;

    if (statusChanged && current.status == LivenessStatus.failure) {
      return _step('Something went wrong. Please try again.');
    }
    if (statusChanged && current.status == LivenessStatus.completed) {
      return _step('All done. Thank you.');
    }

    if (current.status == LivenessStatus.inProgress && next != null) {
      if (previous.status != LivenessStatus.inProgress &&
          previous.status != LivenessStatus.holdingStill) {
        return _step(
          "Let's check it's really you. ${_sentence(instruction(next))}",
        );
      }
      if (current.guidance == FaceGuidance.faceChanged &&
          previous.guidance != FaceGuidance.faceChanged) {
        return _step(
          "A different face was detected. Let's start again. "
          '${_sentence(instruction(next))}',
        );
      }
      if (completed > previousCompleted) {
        return _step('${connector(completed)} ${instruction(next)}.');
      }
    }

    if (current.status == LivenessStatus.holdingStill &&
        previous.status == LivenessStatus.inProgress) {
      return _step('${connector(completed)} $holdStill.');
    }

    if (previous.guidance != current.guidance) {
      return switch (current.guidance) {
        FaceGuidance.noFace => _guidance('Position your face in the frame.'),
        FaceGuidance.multipleFaces => _guidance(
          'Only one face should be visible.',
        ),
        FaceGuidance.faceCamera => _guidance('Face the camera.'),
        FaceGuidance.moveCloser => _guidance('Move a little closer.'),
        FaceGuidance.moveBack => _guidance('Move back a little.'),
        FaceGuidance.centreFace => _guidance('Centre your face in the oval.'),
        // Handled above with the restarted challenge.
        FaceGuidance.faceChanged => null,
        // The problem is fixed: repeat what the user should be doing.
        FaceGuidance.none => switch (current.status) {
          LivenessStatus.holdingStill => _guidance('Hold still.'),
          LivenessStatus.inProgress when next != null => _guidance(
            _sentence(instruction(next)),
          ),
          _ => null,
        },
      };
    }
    return null;
  }

  static VoicePrompt _step(String text) => (text: text, isGuidance: false);

  static VoicePrompt _guidance(String text) => (text: text, isGuidance: true);

  static String _sentence(String phrase) =>
      '${phrase[0].toUpperCase()}${phrase.substring(1)}.';
}
