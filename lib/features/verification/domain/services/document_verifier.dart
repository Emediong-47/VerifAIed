import 'package:injectable/injectable.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/services/document_text_parser.dart';

/// Compares the OCR text of a document with the applicant's details.
/// Whether the document photo shows a face is detected separately and
/// passed in as [verify]'s `isFaceDetected`.
@lazySingleton
class DocumentVerifier {
  const DocumentVerifier(this._parser);

  final DocumentTextParser _parser;

  // Matched against normalized text: upper-case words separated by spaces.
  static final _documentKeywords = {
    DocumentType.nin: RegExp(r'\bNATIONAL IDENTIFICATION\b|\bNIMC\b|\bNIN\b'),
    DocumentType.votersCard: RegExp(
      r'\bINDEPENDENT NATIONAL ELECTORAL\b|\bINEC\b|\bVOTERS?\b',
    ),
    DocumentType.studentId: RegExp(r'\bSTUDENT\b|\bUNIVERSITY\b|\bMATRIC'),
  };

  DocumentVerification verify({
    required String rawText,
    required Applicant applicant,
    required DocumentType documentType,
    required bool isFaceDetected,
  }) {
    final dateOfBirth = _parser.extractDateOfBirth(rawText);

    return DocumentVerification(
      isDocumentTypeMatch: _documentKeywords[documentType]!.hasMatch(
        _parser.normalize(rawText),
      ),
      isNameMatch: _isNameMatch(rawText, applicant),
      isDateOfBirthMatch:
          dateOfBirth != null && _isSameDay(dateOfBirth, applicant.dateOfBirth),
      isFaceDetected: isFaceDetected,
      extractedDateOfBirth: dateOfBirth,
      rawText: rawText,
    );
  }

  /// First and last names must appear on the document. The middle name is
  /// not required because many documents omit it.
  bool _isNameMatch(String rawText, Applicant applicant) {
    final documentWords = _parser.words(rawText);
    final requiredWords = {
      ..._parser.words(applicant.name.firstName),
      ..._parser.words(applicant.name.lastName),
    };
    return requiredWords.isNotEmpty && documentWords.containsAll(requiredWords);
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
