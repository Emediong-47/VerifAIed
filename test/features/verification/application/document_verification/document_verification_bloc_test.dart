import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/application/document_verification/document_verification_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_presence_repository.dart';
import 'package:verif_aled/features/verification/domain/repositories/text_recognition_repository.dart';
import 'package:verif_aled/features/verification/domain/services/document_verifier.dart';

class MockTextRecognitionRepository extends Mock
    implements TextRecognitionRepository {}

class MockFacePresenceRepository extends Mock
    implements FacePresenceRepository {}

class MockDocumentVerifier extends Mock implements DocumentVerifier {}

void main() {
  final applicant = Applicant(
    name: const Name(firstName: 'Emediong', lastName: 'Eshiet'),
    dateOfBirth: DateTime(2000, 5, 20),
  );
  const image = DocumentImage(path: '/tmp/nin.jpg');
  final startedEvent = DocumentVerificationEvent.started(
    applicant: applicant,
    documentType: DocumentType.nin,
    documentImage: image,
  );

  late MockTextRecognitionRepository repository;
  late MockFacePresenceRepository facePresence;
  late MockDocumentVerifier verifier;
  late DocumentVerificationBloc bloc;

  setUp(() {
    repository = MockTextRecognitionRepository();
    facePresence = MockFacePresenceRepository();
    verifier = MockDocumentVerifier();
    when(
      () => facePresence.containsFace(image),
    ).thenAnswer((_) async => const Ok(true));
    bloc = DocumentVerificationBloc(repository, facePresence, verifier);
  });

  tearDown(() => bloc.close());

  test('initial state is initial', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state, const DocumentVerificationState.initial());
  });

  test('emits verifying then verified with the verifier result', () async {
    // Arrange
    const verification = DocumentVerification(
      isDocumentTypeMatch: true,
      isNameMatch: true,
      isDateOfBirthMatch: true,
      isFaceDetected: true,
      rawText: 'NIN TEXT',
    );
    when(
      () => repository.recognizeText(image),
    ).thenAnswer((_) async => const Ok('NIN TEXT'));
    when(
      () => verifier.verify(
        rawText: 'NIN TEXT',
        applicant: applicant,
        documentType: DocumentType.nin,
        isFaceDetected: true,
      ),
    ).thenReturn(verification);
    final expectation = expectLater(
      bloc.stream,
      emitsInOrder(const [
        DocumentVerificationState.verifying(),
        DocumentVerificationState.verified(verification),
      ]),
    );

    // Act
    bloc.add(startedEvent);

    // Assert
    await expectation;
    verify(() => repository.recognizeText(image)).called(1);
  });

  test(
    'emits verified with an unsuccessful result when details mismatch',
    () async {
      // Arrange
      const verification = DocumentVerification(
        isDocumentTypeMatch: true,
        isNameMatch: false,
        isDateOfBirthMatch: true,
        isFaceDetected: true,
        rawText: 'OTHER PERSON',
      );
      when(
        () => repository.recognizeText(image),
      ).thenAnswer((_) async => const Ok('OTHER PERSON'));
      when(
        () => verifier.verify(
          rawText: 'OTHER PERSON',
          applicant: applicant,
          documentType: DocumentType.nin,
          isFaceDetected: true,
        ),
      ).thenReturn(verification);
      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          const DocumentVerificationState.verifying(),
          isA<Verified>().having(
            (s) => s.verification.isSuccessful,
            'isSuccessful',
            isFalse,
          ),
        ]),
      );

      // Act
      bloc.add(startedEvent);

      // Assert
      await expectation;
    },
  );

  test('emits verifying then failure when text recognition fails', () async {
    // Arrange
    when(() => repository.recognizeText(image)).thenAnswer(
      (_) async => const Err(TextRecognitionFailure('model unavailable')),
    );
    final expectation = expectLater(
      bloc.stream,
      emitsInOrder([
        const DocumentVerificationState.verifying(),
        isA<VerificationFailed>().having(
          (s) => s.failure,
          'failure',
          isA<TextRecognitionFailure>(),
        ),
      ]),
    );

    // Act
    bloc.add(startedEvent);

    // Assert
    await expectation;
    verifyNever(
      () => verifier.verify(
        rawText: any(named: 'rawText'),
        applicant: applicant,
        documentType: DocumentType.nin,
        isFaceDetected: any(named: 'isFaceDetected'),
      ),
    );
  });

  test('passes the face check on the ID photo to the verifier', () async {
    // Arrange
    const verification = DocumentVerification(
      isDocumentTypeMatch: true,
      isNameMatch: true,
      isDateOfBirthMatch: true,
      isFaceDetected: false,
      rawText: 'NIN TEXT',
    );
    when(
      () => repository.recognizeText(image),
    ).thenAnswer((_) async => const Ok('NIN TEXT'));
    when(
      () => facePresence.containsFace(image),
    ).thenAnswer((_) async => const Ok(false));
    when(
      () => verifier.verify(
        rawText: 'NIN TEXT',
        applicant: applicant,
        documentType: DocumentType.nin,
        isFaceDetected: false,
      ),
    ).thenReturn(verification);

    // Act
    bloc.add(startedEvent);
    await Future<void>.delayed(Duration.zero);

    // Assert
    expect(bloc.state, const DocumentVerificationState.verified(verification));
    expect(verification.isSuccessful, isFalse);
    verify(() => facePresence.containsFace(image)).called(1);
  });

  test('emits failure when face detection on the ID photo fails', () async {
    // Arrange
    when(
      () => repository.recognizeText(image),
    ).thenAnswer((_) async => const Ok('NIN TEXT'));
    when(() => facePresence.containsFace(image)).thenAnswer(
      (_) async => const Err(FaceProcessingFailure('detector unavailable')),
    );

    // Act
    bloc.add(startedEvent);
    await Future<void>.delayed(Duration.zero);

    // Assert
    expect(
      bloc.state,
      isA<VerificationFailed>().having(
        (s) => s.failure.message,
        'message',
        'detector unavailable',
      ),
    );
  });
}
