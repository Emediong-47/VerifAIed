part of 'face_verification_bloc.dart';

/// Which photo a face verification failure came from.
enum FacePhoto { document, selfie }

@freezed
sealed class FaceVerificationState with _$FaceVerificationState {
  const factory FaceVerificationState.initial() = FaceVerificationInitial;
  const factory FaceVerificationState.verifying() = FaceVerifying;
  const factory FaceVerificationState.verified(FaceVerification verification) =
      FaceVerified;
  const factory FaceVerificationState.failure(
    Failure failure,
    FacePhoto photo,
  ) = FaceVerificationFailed;
}
