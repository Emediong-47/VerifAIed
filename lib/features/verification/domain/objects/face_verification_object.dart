import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

class FaceVerification {
  FaceVerification({
    required this.documentFaceDetected,
    required this.liveFaceDetected,
    required this.facesMatch,
    required this.isSuccessful,
  });

  final DocumentImage documentFaceDetected;
  final DocumentImage liveFaceDetected;
  final double facesMatch;
  final bool isSuccessful;
}
