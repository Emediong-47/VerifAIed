part of 'face_verification_bloc.dart';

@freezed
sealed class FaceVerificationEvent with _$FaceVerificationEvent {
  const factory FaceVerificationEvent.started({
    required DocumentImage documentImage,
    required DocumentImage selfie,
  }) = FaceVerificationStarted;
}
