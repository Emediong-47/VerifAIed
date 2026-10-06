import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

final testApplicant = Applicant(
  name: const Name(
    firstName: 'Emediong',
    middleName: 'Uyobong',
    lastName: 'Eshiet',
  ),
  dateOfBirth: DateTime(2000, 5, 20),
);

final passedDocumentVerification = DocumentVerification(
  isDocumentTypeMatch: true,
  isNameMatch: true,
  isDateOfBirthMatch: true,
  isFaceDetected: true,
  extractedDateOfBirth: DateTime(2000, 5, 20),
  rawText: 'NIN TEXT',
);

/// Events that take a session through every stage of the flow.
List<VerificationSessionEvent> completedSessionEvents({
  DocumentVerification? documentVerification,
  FaceVerification faceVerification = const FaceVerification(
    similarity: 0.82,
    threshold: 0.5,
  ),
}) => [
  VerificationSessionEvent.applicantSubmitted(testApplicant),
  const VerificationSessionEvent.documentTypeSelected(DocumentType.nin),
  const VerificationSessionEvent.documentCaptured(
    DocumentImage(path: '/tmp/nin.jpg'),
  ),
  VerificationSessionEvent.documentVerified(
    documentVerification ?? passedDocumentVerification,
  ),
  const VerificationSessionEvent.livenessPassed(
    DocumentImage(path: '/tmp/selfie.jpg'),
  ),
  VerificationSessionEvent.faceVerified(faceVerification),
];

final testIdentity = VerifiedIdentity(
  applicant: testApplicant,
  documentType: DocumentType.nin,
  selfie: const DocumentImage(path: '/data/identity/selfie_1.jpg'),
  faceSimilarity: 0.82,
  verifiedAt: DateTime(2026, 10, 6, 9, 30),
);
