part of 'verification_session_bloc.dart';

@freezed
abstract class VerificationSessionState with _$VerificationSessionState {
  const VerificationSessionState._();

  const factory VerificationSessionState({
    Applicant? applicant,
    DocumentType? documentType,
    DocumentImage? documentImage,
    DocumentVerification? documentVerification,

    /// Photo taken at the end of a passed liveness check.
    DocumentImage? selfie,
    FaceVerification? faceVerification,
  }) = _VerificationSessionState;

  VerificationSummary get summary => VerificationSummary.from(
    documentVerification: documentVerification,
    selfie: selfie,
    faceVerification: faceVerification,
  );
}
