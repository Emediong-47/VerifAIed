import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';
import 'package:verif_aled/features/verification/domain/services/document_text_parser.dart';
import 'package:verif_aled/features/verification/domain/services/document_verifier.dart';

import '../../../../fixtures/ocr_samples.dart';

void main() {
  const verifier = DocumentVerifier(DocumentTextParser());

  Applicant applicant({
    String firstName = 'Emediong',
    String? middleName = 'Uyobong',
    String lastName = 'Eshiet',
    DateTime? dateOfBirth,
  }) => Applicant(
    name: Name(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
    ),
    dateOfBirth: dateOfBirth ?? DateTime(2000, 5, 20),
  );

  final samples = {
    DocumentType.nin: ninSlipText,
    DocumentType.votersCard: votersCardText,
    DocumentType.studentId: studentIdText,
  };

  for (final MapEntry(key: type, value: text) in samples.entries) {
    test('${type.label} matching the applicant is successful', () {
      // Arrange
      final details = applicant();

      // Act
      final result = verifier.verify(
        rawText: text,
        applicant: details,
        documentType: type,
        isFaceDetected: true,
      );

      // Assert
      expect(result.isDocumentTypeMatch, isTrue);
      expect(result.isNameMatch, isTrue);
      expect(result.isDateOfBirthMatch, isTrue);
      expect(result.extractedDateOfBirth, DateTime(2000, 5, 20));
      expect(result.rawText, text);
      expect(result.isSuccessful, isTrue);
    });
  }

  test('wrong document type fails the type check', () {
    // Arrange
    final details = applicant();

    // Act
    final result = verifier.verify(
      rawText: ninSlipText,
      applicant: details,
      documentType: DocumentType.votersCard,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isDocumentTypeMatch, isFalse);
    expect(result.isSuccessful, isFalse);
  });

  test('name match ignores case', () {
    // Arrange
    final details = applicant(firstName: 'EMEDIONG', lastName: 'eshiet');

    // Act
    final result = verifier.verify(
      rawText: votersCardText,
      applicant: details,
      documentType: DocumentType.votersCard,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isNameMatch, isTrue);
  });

  test('middle name missing from the document still matches', () {
    // Arrange
    final details = applicant(middleName: 'Force');

    // Act
    final result = verifier.verify(
      rawText: studentIdText,
      applicant: details,
      documentType: DocumentType.studentId,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isNameMatch, isTrue);
  });

  test('last name missing from the document fails the name check', () {
    // Arrange
    final details = applicant(lastName: 'Ituen');

    // Act
    final result = verifier.verify(
      rawText: ninSlipText,
      applicant: details,
      documentType: DocumentType.nin,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isNameMatch, isFalse);
    expect(result.isSuccessful, isFalse);
  });

  test('partial name does not match a longer word', () {
    // Arrange
    final details = applicant(firstName: 'Emed');

    // Act
    final result = verifier.verify(
      rawText: ninSlipText,
      applicant: details,
      documentType: DocumentType.nin,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isNameMatch, isFalse);
  });

  test('different date of birth fails the date check', () {
    // Arrange
    final details = applicant(dateOfBirth: DateTime(2000, 5, 21));

    // Act
    final result = verifier.verify(
      rawText: votersCardText,
      applicant: details,
      documentType: DocumentType.votersCard,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isDateOfBirthMatch, isFalse);
    expect(result.extractedDateOfBirth, DateTime(2000, 5, 20));
    expect(result.isSuccessful, isFalse);
  });

  test('document without a date of birth still passes, with a warning', () {
    // Arrange
    const text = 'UNIVERSITY OF UYO\nSTUDENT IDENTITY CARD\nEMEDIONG ESHIET';

    // Act
    final result = verifier.verify(
      rawText: text,
      applicant: applicant(),
      documentType: DocumentType.studentId,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isDateOfBirthMatch, isFalse);
    expect(result.extractedDateOfBirth, isNull);
    expect(result.isSuccessful, isTrue);
    expect(result.hasWarning, isTrue);
  });

  test('empty text fails every check', () {
    // Arrange
    const text = '';

    // Act
    final result = verifier.verify(
      rawText: text,
      applicant: applicant(),
      documentType: DocumentType.nin,
      isFaceDetected: true,
    );

    // Assert
    expect(result.isDocumentTypeMatch, isFalse);
    expect(result.isNameMatch, isFalse);
    expect(result.isDateOfBirthMatch, isFalse);
  });

  test('a document whose photo shows no face does not pass', () {
    // Arrange
    final details = applicant();

    // Act
    final result = verifier.verify(
      rawText: ninSlipText,
      applicant: details,
      documentType: DocumentType.nin,
      isFaceDetected: false,
    );

    // Assert
    expect(result.isNameMatch, isTrue);
    expect(result.isFaceDetected, isFalse);
    expect(result.isSuccessful, isFalse);
    expect(result.hasWarning, isFalse);
  });
}
