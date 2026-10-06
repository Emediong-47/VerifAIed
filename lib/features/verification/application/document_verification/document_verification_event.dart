part of 'document_verification_bloc.dart';

@freezed
sealed class DocumentVerificationEvent with _$DocumentVerificationEvent {
  const factory DocumentVerificationEvent.started({
    required Applicant applicant,
    required DocumentType documentType,
    required DocumentImage documentImage,
  }) = DocumentVerificationStarted;
}
