import 'package:injectable/injectable.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';

/// How well a face is placed for the final selfie.
enum FacePosition { good, turned, tooFar, tooClose, offCentre }

/// Decides whether a face is performing a liveness action, and whether it is
/// placed well enough for the selfie.
@lazySingleton
class LivenessEvaluator {
  const LivenessEvaluator();

  static const turnDegrees = 25.0;
  static const lookUpDegrees = 15.0;
  static const lookDownDegrees = -12.0;
  static const smileProbability = 0.8;

  /// Consecutive matching frames required, so a single noisy frame cannot
  /// complete a challenge.
  static const requiredFrames = 3;

  /// Largest head turn or tilt, in degrees, that still counts as facing the
  /// camera for the selfie.
  static const straightDegrees = 12.0;

  /// How far the face centre may be from the frame centre, as a fraction.
  static const centreTolerance = 0.18;
  static const minFaceWidth = 0.25;
  static const maxFaceWidth = 0.75;

  /// Consecutive well-placed frames required before the selfie is taken.
  static const requiredStillFrames = 5;

  bool isPerforming(LivenessAction action, FaceObservation face) =>
      switch (action) {
        LivenessAction.lookLeft => face.yaw >= turnDegrees,
        LivenessAction.lookRight => face.yaw <= -turnDegrees,
        LivenessAction.lookUp => face.pitch >= lookUpDegrees,
        LivenessAction.lookDown => face.pitch <= lookDownDegrees,
        LivenessAction.smile =>
          (face.smilingProbability ?? 0) >= smileProbability,
      };

  /// Checks the face in order of what the user should fix first. Position
  /// values the camera could not measure are not held against the user.
  FacePosition position(FaceObservation face) {
    if (face.yaw.abs() > straightDegrees ||
        face.pitch.abs() > straightDegrees) {
      return FacePosition.turned;
    }
    if (face.faceWidth case final width?) {
      if (width < minFaceWidth) return FacePosition.tooFar;
      if (width > maxFaceWidth) return FacePosition.tooClose;
    }
    final (x, y) = (face.centerX, face.centerY);
    if (x != null && (x - 0.5).abs() > centreTolerance ||
        y != null && (y - 0.5).abs() > centreTolerance) {
      return FacePosition.offCentre;
    }
    return FacePosition.good;
  }
}
