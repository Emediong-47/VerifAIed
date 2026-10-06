import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_embedding_object.dart';

abstract interface class FaceEmbeddingRepository {
  Future<Result<FaceEmbedding>> embed(DocumentImage image);
}
