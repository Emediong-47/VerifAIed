import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_observation_object.dart';

abstract interface class FaceTrackingRepository {
  Future<Result<void>> start();
  Stream<List<FaceObservation>> get faces;
  Future<Result<DocumentImage>> captureSelfie();
  Future<void> stop();
}
