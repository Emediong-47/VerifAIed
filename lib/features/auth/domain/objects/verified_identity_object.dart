import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

part 'verified_identity_object.freezed.dart';

/// The identity of a user who completed verification; holding one means the
/// user is signed in.
@freezed
abstract class VerifiedIdentity with _$VerifiedIdentity {
  const VerifiedIdentity._();

  const factory VerifiedIdentity({
    required Applicant applicant,
    required DocumentType documentType,
    required DocumentImage selfie,
    required double faceSimilarity,
    required DateTime verifiedAt,

    /// False when the document had no date of birth to compare.
    @Default(true) bool isDateOfBirthConfirmed,

    /// False when the face similarity was below the match threshold.
    @Default(true) bool isFaceMatchConfident,
  }) = _VerifiedIdentity;

  bool get hasWarnings => !isDateOfBirthConfirmed || !isFaceMatchConfident;
}
