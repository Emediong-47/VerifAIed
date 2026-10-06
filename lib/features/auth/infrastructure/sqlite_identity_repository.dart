import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:verif_aled/core/database/app_database.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/auth/domain/repositories/identity_repository.dart';
import 'package:verif_aled/features/auth/infrastructure/selfie_store.dart';
import 'package:verif_aled/features/auth/infrastructure/verified_identity_record.dart';

@LazySingleton(as: IdentityRepository)
class SqliteIdentityRepository implements IdentityRepository {
  SqliteIdentityRepository(this._database, this._selfies);

  final AppDatabase _database;
  final SelfieStore _selfies;

  @override
  Future<Result<VerifiedIdentity?>> current() => _guard(() async {
    return _read(await _database.database);
  });

  @override
  Future<Result<VerifiedIdentity>> save(VerifiedIdentity identity) =>
      _guard(() async {
        final db = await _database.database;
        final previous = await _read(db);
        final saved = identity.copyWith(
          selfie: await _selfies.persist(identity.selfie),
        );
        await db.insert(
          AppDatabase.verifiedIdentityTable,
          VerifiedIdentityRecord.toRow(saved),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        if (previous != null) await _selfies.delete(previous.selfie);
        return saved;
      });

  @override
  Future<Result<void>> clear() => _guard(() async {
    final db = await _database.database;
    final previous = await _read(db);
    await db.delete(AppDatabase.verifiedIdentityTable);
    if (previous != null) await _selfies.delete(previous.selfie);
  });

  Future<VerifiedIdentity?> _read(Database db) async {
    final rows = await db.query(AppDatabase.verifiedIdentityTable, limit: 1);
    return rows.isEmpty ? null : VerifiedIdentityRecord.fromRow(rows.single);
  }

  Future<Result<T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Ok(await action());
    } catch (e) {
      return Err(StorageFailure(e.toString()));
    }
  }
}
