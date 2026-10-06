import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/auth/infrastructure/verified_identity_record.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

import '../../../helpers/session_fixtures.dart';

void main() {
  test('toRow stores every field in its column', () {
    // Arrange
    final identity = testIdentity;

    // Act
    final row = VerifiedIdentityRecord.toRow(identity);

    // Assert
    expect(row, {
      'id': 1,
      'first_name': 'Emediong',
      'middle_name': 'Uyobong',
      'last_name': 'Eshiet',
      'date_of_birth': '2000-05-20T00:00:00.000',
      'document_type': 'nin',
      'selfie_path': '/data/identity/selfie_1.jpg',
      'face_similarity': 0.82,
      'verified_at': '2026-10-06T09:30:00.000',
      'date_of_birth_confirmed': 1,
      'face_match_confident': 1,
    });
  });

  test('unconfirmed checks round-trip', () {
    // Arrange
    final withWarnings = testIdentity.copyWith(
      isDateOfBirthConfirmed: false,
      isFaceMatchConfident: false,
    );
    final row = VerifiedIdentityRecord.toRow(withWarnings);

    // Act
    final identity = VerifiedIdentityRecord.fromRow(row);

    // Assert
    expect(identity, withWarnings);
  });

  test('fromRow restores the identity written by toRow', () {
    // Arrange
    final row = VerifiedIdentityRecord.toRow(testIdentity);

    // Act
    final identity = VerifiedIdentityRecord.fromRow(row);

    // Assert
    expect(identity, testIdentity);
  });

  test('a missing middle name round-trips as null', () {
    // Arrange
    final withoutMiddleName = testIdentity.copyWith.applicant(
      name: const Name(firstName: 'Emediong', lastName: 'Eshiet'),
    );
    final row = VerifiedIdentityRecord.toRow(withoutMiddleName);

    // Act
    final identity = VerifiedIdentityRecord.fromRow(row);

    // Assert
    expect(row['middle_name'], isNull);
    expect(identity.applicant.name.middleName, isNull);
  });

  test('an integer similarity is read as a double', () {
    // Arrange
    final row = {
      ...VerifiedIdentityRecord.toRow(testIdentity),
      'face_similarity': 1,
    };

    // Act
    final identity = VerifiedIdentityRecord.fromRow(row);

    // Assert
    expect(identity.faceSimilarity, 1.0);
  });

  test('an unknown document type is rejected', () {
    // Arrange
    final row = {
      ...VerifiedIdentityRecord.toRow(testIdentity),
      'document_type': 'passport',
    };

    // Act
    void read() => VerifiedIdentityRecord.fromRow(row);

    // Assert
    expect(read, throwsArgumentError);
  });
}
