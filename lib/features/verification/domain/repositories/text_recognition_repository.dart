import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

abstract interface class TextRecognitionRepository {
  Future<Result<String>> recognizeText(DocumentImage image);
}
