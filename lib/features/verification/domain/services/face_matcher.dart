import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:verif_aled/features/verification/domain/objects/face_embedding_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';

/// Decides whether two face embeddings belong to the same person.
@lazySingleton
class FaceMatcher {
  const FaceMatcher();

  /// Minimum cosine similarity for a match. ID photos are small and often
  /// printed, so this is lower than a selfie-to-selfie threshold would be.
  static const matchThreshold = 0.5;

  FaceVerification compare(FaceEmbedding document, FaceEmbedding selfie) =>
      FaceVerification(
        similarity: cosineSimilarity(document.values, selfie.values),
        threshold: matchThreshold,
      );

  static double cosineSimilarity(List<double> a, List<double> b) {
    if (a.length != b.length) {
      throw ArgumentError(
        'Embeddings differ in length: ${a.length} vs '
        '${b.length}',
      );
    }
    var dot = 0.0;
    var normA = 0.0;
    var normB = 0.0;
    for (var i = 0; i < a.length; i++) {
      dot += a[i] * b[i];
      normA += a[i] * a[i];
      normB += b[i] * b[i];
    }
    if (normA == 0 || normB == 0) return 0;
    return dot / (sqrt(normA) * sqrt(normB));
  }
}
