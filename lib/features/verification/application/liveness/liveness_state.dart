part of 'liveness_bloc.dart';

enum LivenessStatus {
  initial,
  starting,
  inProgress,

  /// Challenges are done; waiting for a well-placed face to photograph.
  holdingStill,
  capturing,
  completed,
  failure,
}

enum FaceGuidance {
  none,
  noFace,
  multipleFaces,
  faceChanged,
  faceCamera,
  moveCloser,
  moveBack,
  centreFace,
}

@freezed
abstract class LivenessState with _$LivenessState {
  const factory LivenessState({
    @Default(LivenessStatus.initial) LivenessStatus status,
    LivenessCheck? check,

    /// Consecutive frames meeting the current challenge, or while holding
    /// still, consecutive well-placed frames.
    @Default(0) int matchingFrames,
    int? trackingId,
    @Default(FaceGuidance.none) FaceGuidance guidance,
    DocumentImage? selfie,
    Failure? failure,
  }) = _LivenessState;
}
