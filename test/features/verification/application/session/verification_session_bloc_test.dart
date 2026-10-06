import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/check_status.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

void main() {
  final applicant = Applicant(
    name: const Name(firstName: 'Emediong', lastName: 'Eshiet'),
    dateOfBirth: DateTime(2000, 5, 20),
  );
  const documentImage = DocumentImage(path: '/tmp/nin.jpg');
  final verification = DocumentVerification(
    isDocumentTypeMatch: true,
    isNameMatch: true,
    isDateOfBirthMatch: true,
    isFaceDetected: true,
    extractedDateOfBirth: DateTime(2000, 5, 20),
    rawText: 'NIN TEXT',
  );

  late VerificationSessionBloc bloc;

  setUp(() => bloc = VerificationSessionBloc());

  tearDown(() => bloc.close());

  Future<void> dispatch(VerificationSessionEvent event) async {
    bloc.add(event);
    await Future<void>.delayed(Duration.zero);
  }

  test('initial state holds no data', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state, const VerificationSessionState());
  });

  test('applicantSubmitted stores only the applicant', () async {
    // Arrange
    final event = VerificationSessionEvent.applicantSubmitted(applicant);

    // Act
    await dispatch(event);

    // Assert
    expect(bloc.state, VerificationSessionState(applicant: applicant));
  });

  test(
    'documentTypeSelected stores the type and keeps the applicant',
    () async {
      // Arrange
      await dispatch(VerificationSessionEvent.applicantSubmitted(applicant));

      // Act
      await dispatch(
        const VerificationSessionEvent.documentTypeSelected(
          DocumentType.votersCard,
        ),
      );

      // Assert
      expect(
        bloc.state,
        VerificationSessionState(
          applicant: applicant,
          documentType: DocumentType.votersCard,
        ),
      );
    },
  );

  test('documentCaptured stores the image and keeps earlier data', () async {
    // Arrange
    await dispatch(VerificationSessionEvent.applicantSubmitted(applicant));
    await dispatch(
      const VerificationSessionEvent.documentTypeSelected(DocumentType.nin),
    );

    // Act
    await dispatch(
      const VerificationSessionEvent.documentCaptured(documentImage),
    );

    // Assert
    expect(
      bloc.state,
      VerificationSessionState(
        applicant: applicant,
        documentType: DocumentType.nin,
        documentImage: documentImage,
      ),
    );
  });

  test('documentVerified stores the verification result', () async {
    // Arrange
    await dispatch(
      const VerificationSessionEvent.documentCaptured(documentImage),
    );

    // Act
    await dispatch(VerificationSessionEvent.documentVerified(verification));

    // Assert
    expect(
      bloc.state,
      VerificationSessionState(
        documentImage: documentImage,
        documentVerification: verification,
      ),
    );
  });

  test(
    'documentCaptured clears the verification of the previous image',
    () async {
      // Arrange
      await dispatch(
        const VerificationSessionEvent.documentCaptured(documentImage),
      );
      await dispatch(VerificationSessionEvent.documentVerified(verification));
      const retakenImage = DocumentImage(path: '/tmp/nin-retake.jpg');

      // Act
      await dispatch(
        const VerificationSessionEvent.documentCaptured(retakenImage),
      );

      // Assert
      expect(
        bloc.state,
        const VerificationSessionState(documentImage: retakenImage),
      );
    },
  );

  test('livenessPassed stores the selfie and keeps earlier data', () async {
    // Arrange
    await dispatch(VerificationSessionEvent.applicantSubmitted(applicant));
    const selfie = DocumentImage(path: '/tmp/selfie.jpg');

    // Act
    await dispatch(const VerificationSessionEvent.livenessPassed(selfie));

    // Assert
    expect(
      bloc.state,
      VerificationSessionState(applicant: applicant, selfie: selfie),
    );
  });

  test('faceVerified stores the face match result', () async {
    // Arrange
    const faceVerification = FaceVerification(similarity: 0.8, threshold: 0.5);

    // Act
    await dispatch(
      const VerificationSessionEvent.faceVerified(faceVerification),
    );

    // Assert
    expect(
      bloc.state,
      const VerificationSessionState(faceVerification: faceVerification),
    );
  });

  test('a new selfie clears the previous face match', () async {
    // Arrange
    await dispatch(
      const VerificationSessionEvent.faceVerified(
        FaceVerification(similarity: 0.8, threshold: 0.5),
      ),
    );
    const selfie = DocumentImage(path: '/tmp/selfie-retake.jpg');

    // Act
    await dispatch(const VerificationSessionEvent.livenessPassed(selfie));

    // Assert
    expect(bloc.state, const VerificationSessionState(selfie: selfie));
  });

  test('summary reflects the completed stages', () async {
    // Arrange
    await dispatch(VerificationSessionEvent.documentVerified(verification));

    // Act
    final summary = bloc.state.summary;

    // Assert
    expect(summary.document, CheckStatus.passed);
    expect(summary.liveness, CheckStatus.notCompleted);
    expect(summary.isVerified, isFalse);
  });

  test('reset clears all session data', () async {
    // Arrange
    await dispatch(VerificationSessionEvent.applicantSubmitted(applicant));
    await dispatch(
      const VerificationSessionEvent.documentCaptured(documentImage),
    );

    // Act
    await dispatch(const VerificationSessionEvent.reset());

    // Assert
    expect(bloc.state, const VerificationSessionState());
  });
}
