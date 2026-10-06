import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/domain/enums/check_status.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/verification_summary_object.dart';

void main() {
  final passedDocument = DocumentVerification(
    isDocumentTypeMatch: true,
    isNameMatch: true,
    isDateOfBirthMatch: true,
    isFaceDetected: true,
    extractedDateOfBirth: DateTime(2000, 5, 20),
    rawText: 'NIN TEXT',
  );
  const failedDocument = DocumentVerification(
    isDocumentTypeMatch: true,
    isNameMatch: false,
    isDateOfBirthMatch: true,
    isFaceDetected: true,
    rawText: 'OTHER PERSON',
  );
  const selfie = DocumentImage(path: '/tmp/selfie.jpg');
  const matchingFace = FaceVerification(similarity: 0.8, threshold: 0.5);
  const weakFace = FaceVerification(similarity: 0.2, threshold: 0.5);

  test('every stage passing is verified', () {
    // Arrange & Act
    final summary = VerificationSummary.from(
      documentVerification: passedDocument,
      selfie: selfie,
      faceVerification: matchingFace,
    );

    // Assert
    expect(
      summary,
      const VerificationSummary(
        document: CheckStatus.passed,
        liveness: CheckStatus.passed,
        face: CheckStatus.passed,
      ),
    );
    expect(summary.isVerified, isTrue);
    expect(summary.hasWarnings, isFalse);
  });

  test('nothing completed reports every stage as not completed', () {
    // Arrange & Act
    final summary = VerificationSummary.from();

    // Assert
    expect(
      summary,
      const VerificationSummary(
        document: CheckStatus.notCompleted,
        liveness: CheckStatus.notCompleted,
        face: CheckStatus.notCompleted,
      ),
    );
    expect(summary.isVerified, isFalse);
  });

  test('a failed document check is not verified', () {
    // Arrange & Act
    final summary = VerificationSummary.from(
      documentVerification: failedDocument,
      selfie: selfie,
      faceVerification: matchingFace,
    );

    // Assert
    expect(summary.document, CheckStatus.failed);
    expect(summary.isVerified, isFalse);
  });

  test('a missing selfie means liveness was not completed', () {
    // Arrange & Act
    final summary = VerificationSummary.from(
      documentVerification: passedDocument,
      faceVerification: matchingFace,
    );

    // Assert
    expect(summary.liveness, CheckStatus.notCompleted);
    expect(summary.isVerified, isFalse);
  });

  test('a weak face match is verified with a warning', () {
    // Arrange & Act
    final summary = VerificationSummary.from(
      documentVerification: passedDocument,
      selfie: selfie,
      faceVerification: weakFace,
    );

    // Assert
    expect(summary.face, CheckStatus.passedWithWarning);
    expect(summary.isVerified, isTrue);
    expect(summary.hasWarnings, isTrue);
  });

  test('a document without a date of birth is verified with a warning', () {
    // Arrange
    const documentWithoutDateOfBirth = DocumentVerification(
      isDocumentTypeMatch: true,
      isNameMatch: true,
      isDateOfBirthMatch: false,
      isFaceDetected: true,
      rawText: 'STUDENT ID',
    );

    // Act
    final summary = VerificationSummary.from(
      documentVerification: documentWithoutDateOfBirth,
      selfie: selfie,
      faceVerification: matchingFace,
    );

    // Assert
    expect(summary.document, CheckStatus.passedWithWarning);
    expect(summary.isVerified, isTrue);
    expect(summary.hasWarnings, isTrue);
  });

  test('a date of birth that does not match fails the document check', () {
    // Arrange
    final wrongDateOfBirth = passedDocument.copyWith(isDateOfBirthMatch: false);

    // Act
    final summary = VerificationSummary.from(
      documentVerification: wrongDateOfBirth,
      selfie: selfie,
      faceVerification: matchingFace,
    );

    // Assert
    expect(summary.document, CheckStatus.failed);
    expect(summary.isVerified, isFalse);
  });
}
