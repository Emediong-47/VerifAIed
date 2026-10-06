import 'dart:isolate';
import 'dart:ui';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_embedding_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_embedding_repository.dart';
import 'package:verif_aled/features/verification/infrastructure/face_detectors.dart';
import 'package:verif_aled/features/verification/infrastructure/face_embedder.dart';
import 'package:verif_aled/features/verification/infrastructure/face_image_processor.dart';

/// Finds a face with ML Kit and describes it with MobileFaceNet.
@LazySingleton(as: FaceEmbeddingRepository)
class MlKitFaceEmbeddingRepository implements FaceEmbeddingRepository {
  MlKitFaceEmbeddingRepository(
    @Named(stillFaceDetector) this._detector,
    this._embedder,
  );

  final FaceDetector _detector;
  final FaceEmbedder _embedder;

  @override
  Future<Result<FaceEmbedding>> embed(DocumentImage image) async {
    try {
      final faces = await _detector.processImage(
        InputImage.fromFilePath(image.path),
      );
      if (faces.isEmpty) return const Err(NoFaceDetected());

      // The largest face is the document holder or the person taking the
      // selfie, not someone in the background.
      final face = faces
          .reduce((a, b) => _area(a) >= _area(b) ? a : b)
          .boundingBox;
      final crop = await _cropInIsolate(image.path, face);
      if (crop == null) {
        return const Err(FaceProcessingFailure('Could not read the photo'));
      }

      return Ok(FaceEmbedding(await _embedder.embed(crop)));
    } catch (e) {
      return Err(FaceProcessingFailure(e.toString()));
    }
  }

  /// Static so the closure can't capture `this`: the repository holds the
  /// embedder's pending interpreter [Future], which can't be sent to an isolate.
  static Future<img.Image?> _cropInIsolate(String path, Rect face) =>
      Isolate.run(() => FaceImageProcessor.loadAndCropFace(path, face));

  double _area(Face face) => face.boundingBox.width * face.boundingBox.height;
}
