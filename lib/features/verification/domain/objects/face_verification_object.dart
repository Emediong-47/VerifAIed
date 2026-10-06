import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_verification_object.freezed.dart';

/// The result of comparing the ID photo with the selfie. A low similarity
/// does not stop the user, because ID photos are often too small or blurry
/// to compare well; it is reported as a weak match instead.
@freezed
abstract class FaceVerification with _$FaceVerification {
  const FaceVerification._();

  const factory FaceVerification({
    /// Cosine similarity between the two faces, from -1 to 1.
    required double similarity,
    required double threshold,
  }) = _FaceVerification;

  bool get isConfidentMatch => similarity >= threshold;
}
