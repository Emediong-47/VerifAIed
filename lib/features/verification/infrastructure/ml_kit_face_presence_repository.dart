import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_presence_repository.dart';
import 'package:verif_aled/features/verification/infrastructure/face_detectors.dart';

@LazySingleton(as: FacePresenceRepository)
class MlKitFacePresenceRepository implements FacePresenceRepository {
  MlKitFacePresenceRepository(@Named(stillFaceDetector) this._detector);

  final FaceDetector _detector;

  @override
  Future<Result<bool>> containsFace(DocumentImage image) async {
    try {
      final faces = await _detector.processImage(
        InputImage.fromFilePath(image.path),
      );
      return Ok(faces.isNotEmpty);
    } catch (e) {
      return Err(FaceProcessingFailure(e.toString()));
    }
  }
}
