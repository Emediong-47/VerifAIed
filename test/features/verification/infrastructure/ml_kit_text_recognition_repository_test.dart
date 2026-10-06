import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/infrastructure/ml_kit_text_recognition_repository.dart';

class MockTextRecognizer extends Mock implements TextRecognizer {}

void main() {
  const image = DocumentImage(path: '/tmp/nin.jpg');

  late MockTextRecognizer recognizer;
  late MlKitTextRecognitionRepository repository;

  setUpAll(() {
    registerFallbackValue(InputImage.fromFilePath('/fallback.jpg'));
  });

  setUp(() {
    recognizer = MockTextRecognizer();
    repository = MlKitTextRecognitionRepository(recognizer);
  });

  test('returns the recognized text for the image file', () async {
    // Arrange
    when(() => recognizer.processImage(any())).thenAnswer(
      (_) async => RecognizedText(text: 'NATIONAL IDENTIFICATION', blocks: []),
    );

    // Act
    final result = await repository.recognizeText(image);

    // Assert
    expect(
      result,
      isA<Ok<String>>().having(
        (r) => r.value,
        'value',
        'NATIONAL IDENTIFICATION',
      ),
    );
    final input =
        verify(() => recognizer.processImage(captureAny())).captured.single
            as InputImage;
    expect(input.filePath, image.path);
  });

  test('returns TextRecognitionFailure when recognition throws', () async {
    // Arrange
    when(
      () => recognizer.processImage(any()),
    ).thenThrow(Exception('model unavailable'));

    // Act
    final result = await repository.recognizeText(image);

    // Assert
    expect(
      result,
      isA<Err<String>>().having(
        (r) => r.failure,
        'failure',
        isA<TextRecognitionFailure>().having(
          (f) => f.message,
          'message',
          contains('model unavailable'),
        ),
      ),
    );
  });
}
