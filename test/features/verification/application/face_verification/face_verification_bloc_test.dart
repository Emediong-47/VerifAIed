import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/application/face_verification/face_verification_bloc.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_embedding_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_embedding_repository.dart';
import 'package:verif_aled/features/verification/domain/services/face_matcher.dart';

class MockFaceEmbeddingRepository extends Mock
    implements FaceEmbeddingRepository {}

void main() {
  const documentImage = DocumentImage(path: '/tmp/nin.jpg');
  const selfie = DocumentImage(path: '/tmp/selfie.jpg');
  const startedEvent = FaceVerificationEvent.started(
    documentImage: documentImage,
    selfie: selfie,
  );

  late MockFaceEmbeddingRepository repository;
  late FaceVerificationBloc bloc;

  setUp(() {
    repository = MockFaceEmbeddingRepository();
    bloc = FaceVerificationBloc(repository, const FaceMatcher());
  });

  tearDown(() => bloc.close());

  void embeds(DocumentImage image, Result<FaceEmbedding> result) =>
      when(() => repository.embed(image)).thenAnswer((_) async => result);

  test('initial state is initial', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state, const FaceVerificationState.initial());
  });

  test('emits verifying then a match for the same face', () async {
    // Arrange
    embeds(documentImage, const Ok(FaceEmbedding([0.6, 0.8])));
    embeds(selfie, const Ok(FaceEmbedding([0.6, 0.8])));
    final expectation = expectLater(
      bloc.stream,
      emitsInOrder(const [
        FaceVerificationState.verifying(),
        FaceVerificationState.verified(
          FaceVerification(
            similarity: 1,
            threshold: FaceMatcher.matchThreshold,
          ),
        ),
      ]),
    );

    // Act
    bloc.add(startedEvent);

    // Assert
    await expectation;
    verifyInOrder([
      () => repository.embed(documentImage),
      () => repository.embed(selfie),
    ]);
  });

  test('emits verified without a match for different faces', () async {
    // Arrange
    embeds(documentImage, const Ok(FaceEmbedding([1, 0])));
    embeds(selfie, const Ok(FaceEmbedding([0, 1])));

    // Act
    bloc.add(startedEvent);
    await Future<void>.delayed(Duration.zero);

    // Assert
    expect(
      bloc.state,
      isA<FaceVerified>().having(
        (s) => s.verification.isConfidentMatch,
        'isConfidentMatch',
        isFalse,
      ),
    );
  });

  test('a document photo failure is reported against the document', () async {
    // Arrange
    embeds(documentImage, const Err(NoFaceDetected()));

    // Act
    bloc.add(startedEvent);
    await Future<void>.delayed(Duration.zero);

    // Assert
    expect(
      bloc.state,
      const FaceVerificationState.failure(NoFaceDetected(), FacePhoto.document),
    );
    verifyNever(() => repository.embed(selfie));
  });

  test('a selfie failure is reported against the selfie', () async {
    // Arrange
    embeds(documentImage, const Ok(FaceEmbedding([1, 0])));
    embeds(selfie, const Err(FaceProcessingFailure('blurry')));

    // Act
    bloc.add(startedEvent);
    await Future<void>.delayed(Duration.zero);

    // Assert
    expect(
      bloc.state,
      isA<FaceVerificationFailed>()
          .having((s) => s.photo, 'photo', FacePhoto.selfie)
          .having((s) => s.failure.message, 'message', 'blurry'),
    );
  });
}
