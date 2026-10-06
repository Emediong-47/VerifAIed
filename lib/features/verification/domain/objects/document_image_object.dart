import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_image_object.freezed.dart';

@freezed
abstract class DocumentImage with _$DocumentImage {
  const factory DocumentImage({required String path}) = _DocumentImage;
}
