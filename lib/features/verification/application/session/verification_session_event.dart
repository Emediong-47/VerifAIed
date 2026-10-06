part of 'verification_session_bloc.dart';

@freezed
sealed class VerificationSessionEvent with _$VerificationSessionEvent {
  const factory VerificationSessionEvent.applicantSubmitted(
    Applicant applicant,
  ) = ApplicantSubmitted;
  const factory VerificationSessionEvent.documentTypeSelected(
    DocumentType documentType,
  ) = DocumentTypeSelected;
  const factory VerificationSessionEvent.documentCaptured(
    DocumentImage documentImage,
  ) = DocumentCaptured;
  const factory VerificationSessionEvent.documentVerified(
    DocumentVerification verification,
  ) = DocumentVerified;
  const factory VerificationSessionEvent.livenessPassed(DocumentImage selfie) =
      LivenessPassed;
  const factory VerificationSessionEvent.faceVerified(
    FaceVerification verification,
  ) = FaceVerificationCompleted;
  const factory VerificationSessionEvent.reset() = SessionReset;
}
