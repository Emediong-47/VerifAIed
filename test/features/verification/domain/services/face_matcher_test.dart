import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/domain/objects/face_embedding_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/domain/services/face_matcher.dart';

void main() {
  const matcher = FaceMatcher();

  group('cosineSimilarity', () {
    final cases = <(String, List<double>, List<double>, double)>[
      ('identical vectors', [0.2, 0.4, 0.6], [0.2, 0.4, 0.6], 1),
      ('same direction, different length', [1, 2, 3], [2, 4, 6], 1),
      ('perpendicular vectors', [1, 0], [0, 1], 0),
      ('opposite vectors', [1, -1], [-1, 1], -1),
      ('45 degrees apart', [1, 0], [1, 1], 0.7071),
      ('a zero vector', [0, 0], [1, 1], 0),
    ];

    for (final (description, a, b, expected) in cases) {
      test('$description gives $expected', () {
        // Arrange
        final first = a;
        final second = b;

        // Act
        final result = FaceMatcher.cosineSimilarity(first, second);

        // Assert
        expect(result, closeTo(expected, 0.0001));
      });
    }

    test('embeddings of different lengths are rejected', () {
      // Arrange
      const first = [1.0, 0.0];
      const second = [1.0, 0.0, 0.0];

      // Act
      double compare() => FaceMatcher.cosineSimilarity(first, second);

      // Assert
      expect(compare, throwsArgumentError);
    });
  });

  group('compare', () {
    test('similar faces match', () {
      // Arrange
      const document = FaceEmbedding([0.9, 0.1, 0.2]);
      const selfie = FaceEmbedding([0.8, 0.2, 0.25]);

      // Act
      final result = matcher.compare(document, selfie);

      // Assert
      expect(result.similarity, greaterThan(FaceMatcher.matchThreshold));
      expect(result.threshold, FaceMatcher.matchThreshold);
      expect(result.isConfidentMatch, isTrue);
    });

    test('different faces do not match', () {
      // Arrange
      const document = FaceEmbedding([1, 0, 0]);
      const selfie = FaceEmbedding([0, 1, 0]);

      // Act
      final result = matcher.compare(document, selfie);

      // Assert
      expect(result.isConfidentMatch, isFalse);
    });
  });

  group('FaceVerification.isConfidentMatch', () {
    test('a similarity exactly at the threshold is a match', () {
      // Arrange
      const verification = FaceVerification(similarity: 0.5, threshold: 0.5);

      // Act
      final result = verification.isConfidentMatch;

      // Assert
      expect(result, isTrue);
    });

    test('a similarity just below the threshold is not a match', () {
      // Arrange
      const verification = FaceVerification(similarity: 0.4999, threshold: 0.5);

      // Act
      final result = verification.isConfidentMatch;

      // Assert
      expect(result, isFalse);
    });
  });
}
