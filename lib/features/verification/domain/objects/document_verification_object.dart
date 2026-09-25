import 'package:verif_aled/features/verification/domain/enums/document_type.dart';

class DocumentVerification {
  DocumentVerification({
    required this.documentTypeValid,
    required this.text,
    required this.isNameMatch,
    required this.isDateOfBirthMatch,
    required this.isSuccessful,
  });

  final DocumentType documentTypeValid;
  final String text;
  final bool isNameMatch;
  final bool isDateOfBirthMatch;
  final bool isSuccessful;
}
