import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:verif_aled/core/database/app_database.dart';

void main() {
  late Directory storage;
  late String path;

  setUpAll(sqfliteFfiInit);

  setUp(() {
    storage = Directory.systemTemp.createTempSync('app_database');
    path = p.join(storage.path, 'test.db');
  });

  tearDown(() => storage.deleteSync(recursive: true));

  test(
    'upgrading from version 1 keeps the identity as fully confirmed',
    () async {
      // Arrange
      final v1 = await databaseFactoryFfi.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, _) async {
            await db.execute('''
            CREATE TABLE ${AppDatabase.verifiedIdentityTable} (
              id INTEGER PRIMARY KEY CHECK (id = 1),
              first_name TEXT NOT NULL,
              middle_name TEXT,
              last_name TEXT NOT NULL,
              date_of_birth TEXT NOT NULL,
              document_type TEXT NOT NULL,
              selfie_path TEXT NOT NULL,
              face_similarity REAL NOT NULL,
              verified_at TEXT NOT NULL
            )
          ''');
            await db.insert(AppDatabase.verifiedIdentityTable, {
              'id': 1,
              'first_name': 'Emediong',
              'last_name': 'Eshiet',
              'date_of_birth': '2000-05-20T00:00:00.000',
              'document_type': 'nin',
              'selfie_path': '/data/selfie.jpg',
              'face_similarity': 0.82,
              'verified_at': '2026-10-06T09:30:00.000',
            });
          },
        ),
      );
      await v1.close();
      final database = AppDatabase(databaseFactoryFfi, path: path);

      // Act
      final rows = await (await database.database).query(
        AppDatabase.verifiedIdentityTable,
      );
      await database.close();

      // Assert
      expect(rows.single['date_of_birth_confirmed'], 1);
      expect(rows.single['face_match_confident'], 1);
    },
  );
}
