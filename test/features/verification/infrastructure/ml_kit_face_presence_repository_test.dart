import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/infrastructure/ml_kit_face_presence_repository.dart';

class MockFaceDetector extends Mock implements FaceDetector {}

void main() {
  const image = DocumentImage(path: '/tmp/nin.jpg');

  late MockFaceDetector detector;
  late MlKitFacePresenceRepository repository;

  Face face() => Face(
    boundingBox: const Rect.fromLTWH(10, 10, 40, 40),
    landmarks: const {},
    contours: const {},
  );

  setUpAll(() => registerFallbackValue(InputImage.fromFilePath('/x.jpg')));

  setUp(() {
    detector = MockFaceDetector();
    repository = MlKitFacePresenceRepository(detector);
  });

  test('a photo with a face reports true', () async {
    // Arrange
    when(() => detector.processImage(any())).thenAnswer((_) async => [face()]);

    // Act
    final result = await repository.containsFace(image);

    // Assert
    expect(result, isA<Ok<bool>>().having((r) => r.value, 'value', isTrue));
    final input =
        verify(() => detector.processImage(captureAny())).captured.single
            as InputImage;
    expect(input.filePath, image.path);
  });

  test('a photo without a face reports false', () async {
    // Arrange
    when(() => detector.processImage(any())).thenAnswer((_) async => []);

    // Act
    final result = await repository.containsFace(image);

    // Assert
    expect(result, isA<Ok<bool>>().having((r) => r.value, 'value', isFalse));
  });

  test('a detector error is a FaceProcessingFailure', () async {
    // Arrange
    when(() => detector.processImage(any())).thenThrow(Exception('no model'));

    // Act
    final result = await repository.containsFace(image);

    // Assert
    expect(
      result,
      isA<Err<bool>>().having(
        (r) => r.failure,
        'failure',
        isA<FaceProcessingFailure>(),
      ),
    );
  });
}
