import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_embedding_object.dart';
import 'package:verif_aled/features/verification/infrastructure/face_embedder.dart';
import 'package:verif_aled/features/verification/infrastructure/face_image_processor.dart';
import 'package:verif_aled/features/verification/infrastructure/ml_kit_face_embedding_repository.dart';

class MockFaceDetector extends Mock implements FaceDetector {}

class MockFaceEmbedder extends Mock implements FaceEmbedder {}

void main() {
  const largeFace = Rect.fromLTWH(100, 100, 200, 200);
  const smallFace = Rect.fromLTWH(10, 10, 40, 40);

  late Directory directory;
  late DocumentImage photo;
  late MockFaceDetector detector;
  late MockFaceEmbedder embedder;
  late MlKitFaceEmbeddingRepository repository;

  Face face(Rect box) =>
      Face(boundingBox: box, landmarks: const {}, contours: const {});

  setUpAll(() {
    registerFallbackValue(InputImage.fromFilePath('/fallback.jpg'));
    registerFallbackValue(img.Image(width: 1, height: 1));
  });

  setUp(() {
    directory = Directory.systemTemp.createTempSync('embedding');
    // Blue photo with a large red face and a small green face.
    final image = img.Image(width: 400, height: 400);
    img.fill(image, color: img.ColorRgb8(0, 0, 255));
    img.fillRect(
      image,
      x1: 100,
      y1: 100,
      x2: 300,
      y2: 300,
      color: img.ColorRgb8(255, 0, 0),
    );
    img.fillRect(
      image,
      x1: 10,
      y1: 10,
      x2: 50,
      y2: 50,
      color: img.ColorRgb8(0, 255, 0),
    );
    final file = File('${directory.path}/selfie.png')
      ..writeAsBytesSync(img.encodePng(image));
    photo = DocumentImage(path: file.path);

    detector = MockFaceDetector();
    embedder = MockFaceEmbedder();
    repository = MlKitFaceEmbeddingRepository(detector, embedder);
    when(() => embedder.embed(any())).thenAnswer((_) async => [0.1, 0.2]);
  });

  tearDown(() => directory.deleteSync(recursive: true));

  test('returns the embedding of the detected face', () async {
    // Arrange
    when(
      () => detector.processImage(any()),
    ).thenAnswer((_) async => [face(largeFace)]);

    // Act
    final result = await repository.embed(photo);

    // Assert
    expect(
      result,
      isA<Ok<FaceEmbedding>>().having(
        (r) => r.value,
        'value',
        const FaceEmbedding([0.1, 0.2]),
      ),
    );
    final input =
        verify(() => detector.processImage(captureAny())).captured.single
            as InputImage;
    expect(input.filePath, photo.path);
  });

  test('embeds the largest face when several are detected', () async {
    // Arrange
    when(
      () => detector.processImage(any()),
    ).thenAnswer((_) async => [face(smallFace), face(largeFace)]);

    // Act
    await repository.embed(photo);

    // Assert
    final crop =
        verify(() => embedder.embed(captureAny())).captured.single as img.Image;
    const centre = FaceImageProcessor.modelInputSize ~/ 2;
    final pixel = crop.getPixel(centre, centre);
    expect(crop.width, FaceImageProcessor.modelInputSize);
    expect((pixel.r, pixel.g), (255, 0));
  });

  test('returns NoFaceDetected when there is no face', () async {
    // Arrange
    when(() => detector.processImage(any())).thenAnswer((_) async => []);

    // Act
    final result = await repository.embed(photo);

    // Assert
    expect(
      result,
      isA<Err<FaceEmbedding>>().having(
        (r) => r.failure,
        'failure',
        isA<NoFaceDetected>(),
      ),
    );
    verifyNever(() => embedder.embed(any()));
  });

  test('returns FaceProcessingFailure when the photo cannot be read', () async {
    // Arrange
    when(
      () => detector.processImage(any()),
    ).thenAnswer((_) async => [face(largeFace)]);
    final missing = DocumentImage(path: '${directory.path}/missing.png');

    // Act
    final result = await repository.embed(missing);

    // Assert
    expect(
      result,
      isA<Err<FaceEmbedding>>().having(
        (r) => r.failure,
        'failure',
        isA<FaceProcessingFailure>(),
      ),
    );
  });

  test('returns FaceProcessingFailure when the model fails', () async {
    // Arrange
    when(
      () => detector.processImage(any()),
    ).thenAnswer((_) async => [face(largeFace)]);
    when(() => embedder.embed(any())).thenThrow(StateError('model missing'));

    // Act
    final result = await repository.embed(photo);

    // Assert
    expect(
      result,
      isA<Err<FaceEmbedding>>().having(
        (r) => r.failure.message,
        'message',
        contains('model missing'),
      ),
    );
  });
}
