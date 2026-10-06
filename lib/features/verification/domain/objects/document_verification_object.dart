import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_verification_object.freezed.dart';

@freezed
abstract class DocumentVerification with _$DocumentVerification {
  const DocumentVerification._();

  const factory DocumentVerification({
    required bool isDocumentTypeMatch,
    required bool isNameMatch,
    required bool isDateOfBirthMatch,

    /// Whether the holder's photo on the document shows a detectable face,
    /// which the face match later depends on.
    required bool isFaceDetected,
    DateTime? extractedDateOfBirth,
    required String rawText,
  }) = _DocumentVerification;

  /// Not every document prints a date of birth, so a missing one is not held
  /// against the user. One that is found must still match.
  bool get isDateOfBirthFound => extractedDateOfBirth != null;

  bool get isSuccessful =>
      isDocumentTypeMatch &&
      isNameMatch &&
      (isDateOfBirthMatch || !isDateOfBirthFound) &&
      isFaceDetected;

  /// Passed without confirming the date of birth.
  bool get hasWarning => isSuccessful && !isDateOfBirthFound;
}
