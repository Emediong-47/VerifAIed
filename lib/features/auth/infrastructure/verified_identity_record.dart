import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

/// Converts a [VerifiedIdentity] to and from a database row.
abstract final class VerifiedIdentityRecord {
  static Map<String, Object?> toRow(VerifiedIdentity identity) => {
    'id': 1,
    'first_name': identity.applicant.name.firstName,
    'middle_name': identity.applicant.name.middleName,
    'last_name': identity.applicant.name.lastName,
    'date_of_birth': identity.applicant.dateOfBirth.toIso8601String(),
    'document_type': identity.documentType.name,
    'selfie_path': identity.selfie.path,
    'face_similarity': identity.faceSimilarity,
    'verified_at': identity.verifiedAt.toIso8601String(),
    'date_of_birth_confirmed': identity.isDateOfBirthConfirmed ? 1 : 0,
    'face_match_confident': identity.isFaceMatchConfident ? 1 : 0,
  };

  /// Throws [FormatException] or [ArgumentError] for a malformed row.
  static VerifiedIdentity fromRow(Map<String, Object?> row) => VerifiedIdentity(
    applicant: Applicant(
      name: Name(
        firstName: row['first_name']! as String,
        middleName: row['middle_name'] as String?,
        lastName: row['last_name']! as String,
      ),
      dateOfBirth: DateTime.parse(row['date_of_birth']! as String),
    ),
    documentType: DocumentType.values.byName(row['document_type']! as String),
    selfie: DocumentImage(path: row['selfie_path']! as String),
    faceSimilarity: (row['face_similarity']! as num).toDouble(),
    verifiedAt: DateTime.parse(row['verified_at']! as String),
    isDateOfBirthConfirmed: row['date_of_birth_confirmed'] != 0,
    isFaceMatchConfident: row['face_match_confident'] != 0,
  );
}
