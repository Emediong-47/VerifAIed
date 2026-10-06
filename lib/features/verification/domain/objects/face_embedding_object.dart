import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_embedding_object.freezed.dart';

/// A vector describing a face; similar faces have similar vectors.
@freezed
abstract class FaceEmbedding with _$FaceEmbedding {
  const factory FaceEmbedding(List<double> values) = _FaceEmbedding;
}
