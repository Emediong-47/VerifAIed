import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/text_recognition_repository.dart';

@LazySingleton(as: TextRecognitionRepository)
class MlKitTextRecognitionRepository implements TextRecognitionRepository {
  MlKitTextRecognitionRepository(this._recognizer);

  final TextRecognizer _recognizer;

  @override
  Future<Result<String>> recognizeText(DocumentImage image) async {
    try {
      final recognized = await _recognizer.processImage(
        InputImage.fromFilePath(image.path),
      );
      return Ok(recognized.text);
    } catch (e) {
      return Err(TextRecognitionFailure(e.toString()));
    }
  }
}
