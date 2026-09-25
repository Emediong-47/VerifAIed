import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

class Applicant{
  Applicant({required this.name, required this.dateOfBirth});

  final Name name;
  final DateTime dateOfBirth;
}