import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_observation_object.freezed.dart';

/// A face seen in one camera frame, from the user's point of view.
@freezed
abstract class FaceObservation with _$FaceObservation {
  const factory FaceObservation({
    /// Degrees the head is turned; positive means towards the user's left.
    required double yaw,

    /// Degrees the head is tilted; positive means looking up.
    required double pitch,
    double? smilingProbability,

    /// Stays the same while the detector keeps seeing the same face.
    int? trackingId,

    /// Centre of the face as a fraction of the upright frame, 0..1.
    /// Null when the frame size is unknown.
    double? centerX,
    double? centerY,

    /// Face width as a fraction of the upright frame width.
    double? faceWidth,
  }) = _FaceObservation;
}
