import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

part 'applicant_object.freezed.dart';

@freezed
abstract class Applicant with _$Applicant {
  const factory Applicant({required Name name, required DateTime dateOfBirth}) =
      _Applicant;
}
