import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';

class IdentityDocuments {
  IdentityDocuments({required this.type, required this.front, required this.back});

  final DocumentType type;
  final DocumentImage front;
  final DocumentImage back;


}