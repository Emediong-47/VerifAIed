import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

part 'identity_documents_object.freezed.dart';

@freezed
abstract class IdentityDocuments with _$IdentityDocuments {
  const factory IdentityDocuments({
    required DocumentType type,
    required DocumentImage front,
    DocumentImage? back,
  }) = _IdentityDocuments;
}
