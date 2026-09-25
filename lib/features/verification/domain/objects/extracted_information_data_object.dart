import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

class ExtractedInformationData {
  ExtractedInformationData({
    required this.name,
    required this.dateOfBirth,
    required this.rawText,
  });

  final Name name;
  final String dateOfBirth;
  final String rawText;
}
