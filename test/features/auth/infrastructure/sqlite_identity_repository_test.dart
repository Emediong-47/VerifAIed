import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:verif_aled/core/database/app_database.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/auth/infrastructure/selfie_store.dart';
import 'package:verif_aled/features/auth/infrastructure/sqlite_identity_repository.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

import '../../../helpers/fixed_clock.dart';
import '../../../helpers/session_fixtures.dart';

void main() {
  late Directory storage;
  late AppDatabase database;
  late SqliteIdentityRepository repository;
  var clockMicros = 0;

  setUpAll(sqfliteFfiInit);

  setUp(() {
    storage = Directory.systemTemp.createTempSync('identity_repo');
    database = AppDatabase(
      databaseFactoryFfi,
      path: p.join(storage.path, 'test.db'),
    );
    repository = SqliteIdentityRepository(
      database,
      SelfieStore(
        _IncrementingClock(() => clockMicros++),
        directory: () async => storage,
      ),
    );
  });

  tearDown(() async {
    await database.close();
    storage.deleteSync(recursive: true);
  });

  /// An identity whose selfie is a real file in the camera cache.
  VerifiedIdentity identityWithSelfie(String name) {
    final photo = File(p.join(storage.path, 'cache', name))
      ..createSync(recursive: true)
      ..writeAsBytesSync([9]);
    return testIdentity.copyWith(selfie: DocumentImage(path: photo.path));
  }

  test('current is null before anyone has verified', () async {
    // Arrange & Act
    final result = await repository.current();

    // Assert
    expect(
      result,
      isA<Ok<VerifiedIdentity?>>().having((r) => r.value, 'value', isNull),
    );
  });

  test('save stores the identity with its selfie in app storage', () async {
    // Arrange
    final identity = identityWithSelfie('CAP1.jpg');

    // Act
    final saved = await repository.save(identity);
    final current = await repository.current();

    // Assert
    final savedIdentity = (saved as Ok<VerifiedIdentity>).value;
    expect(
      p.dirname(savedIdentity.selfie.path),
      p.join(storage.path, SelfieStore.folder),
    );
    expect(File(savedIdentity.selfie.path).existsSync(), isTrue);
    expect(savedIdentity.copyWith(selfie: identity.selfie), identity);
    expect((current as Ok<VerifiedIdentity?>).value, savedIdentity);
  });

  test('saving again replaces the identity and its old selfie', () async {
    // Arrange
    final first =
        (await repository.save(identityWithSelfie('CAP1.jpg'))
                as Ok<VerifiedIdentity>)
            .value;
    final second = identityWithSelfie('CAP2.jpg').copyWith(faceSimilarity: 0.9);

    // Act
    final saved = (await repository.save(second) as Ok<VerifiedIdentity>).value;
    final current = (await repository.current() as Ok<VerifiedIdentity?>).value;
    final rows = await (await database.database).query(
      AppDatabase.verifiedIdentityTable,
    );

    // Assert
    expect(rows, hasLength(1));
    expect(current, saved);
    expect(current!.faceSimilarity, 0.9);
    expect(File(first.selfie.path).existsSync(), isFalse);
    expect(File(saved.selfie.path).existsSync(), isTrue);
  });

  test('clear removes the identity and its selfie', () async {
    // Arrange
    final saved =
        (await repository.save(identityWithSelfie('CAP1.jpg'))
                as Ok<VerifiedIdentity>)
            .value;

    // Act
    final result = await repository.clear();
    final current = await repository.current();

    // Assert
    expect(result, isA<Ok<void>>());
    expect((current as Ok<VerifiedIdentity?>).value, isNull);
    expect(File(saved.selfie.path).existsSync(), isFalse);
  });

  test('clear succeeds when nobody is signed in', () async {
    // Arrange & Act
    final result = await repository.clear();

    // Assert
    expect(result, isA<Ok<void>>());
  });

  test('a missing selfie file fails the save with StorageFailure', () async {
    // Arrange
    final identity = testIdentity.copyWith(
      selfie: DocumentImage(path: p.join(storage.path, 'missing.jpg')),
    );

    // Act
    final result = await repository.save(identity);

    // Assert
    expect(
      result,
      isA<Err<VerifiedIdentity>>().having(
        (r) => r.failure,
        'failure',
        isA<StorageFailure>(),
      ),
    );
    expect((await repository.current() as Ok<VerifiedIdentity?>).value, isNull);
  });

  test('a corrupt row is reported as StorageFailure', () async {
    // Arrange
    final db = await database.database;
    await db.insert(AppDatabase.verifiedIdentityTable, {
      'id': 1,
      'first_name': 'Emediong',
      'last_name': 'Eshiet',
      'date_of_birth': 'not a date',
      'document_type': 'nin',
      'selfie_path': '/x.jpg',
      'face_similarity': 0.8,
      'verified_at': '2026-10-06T09:30:00.000',
    });

    // Act
    final result = await repository.current();

    // Assert
    expect(
      result,
      isA<Err<VerifiedIdentity?>>().having(
        (r) => r.failure,
        'failure',
        isA<StorageFailure>(),
      ),
    );
  });

  test('an identity survives reopening the database', () async {
    // Arrange
    final saved =
        (await repository.save(identityWithSelfie('CAP1.jpg'))
                as Ok<VerifiedIdentity>)
            .value;
    await database.close();

    // Act
    final current = await repository.current();

    // Assert
    expect((current as Ok<VerifiedIdentity?>).value, saved);
  });
}

class _IncrementingClock extends FixedClock {
  _IncrementingClock(this._next) : super(DateTime(0));

  final int Function() _next;

  @override
  DateTime now() => DateTime.fromMicrosecondsSinceEpoch(_next());
}
