import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

/// The app's SQLite database, opened on first use.
@lazySingleton
class AppDatabase {
  AppDatabase(this._factory, {@ignoreParam this._path});

  static const fileName = 'verifaied.db';
  static const version = 2;

  /// Holds at most one row: the identity of the signed-in user.
  static const verifiedIdentityTable = 'verified_identity';

  final DatabaseFactory _factory;
  final String? _path;
  Future<Database>? _database;

  Future<Database> get database => _database ??= _open();

  Future<Database> _open() async {
    try {
      final path = _path ?? p.join(await _factory.getDatabasesPath(), fileName);
      return await _factory.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: version,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
        ),
      );
    } catch (_) {
      // Allow the next access to try opening again.
      _database = null;
      rethrow;
    }
  }

  static Future<void> _onCreate(Database db, int version) => db.execute('''
    CREATE TABLE $verifiedIdentityTable (
      id INTEGER PRIMARY KEY CHECK (id = 1),
      first_name TEXT NOT NULL,
      middle_name TEXT,
      last_name TEXT NOT NULL,
      date_of_birth TEXT NOT NULL,
      document_type TEXT NOT NULL,
      selfie_path TEXT NOT NULL,
      face_similarity REAL NOT NULL,
      verified_at TEXT NOT NULL,
      date_of_birth_confirmed INTEGER NOT NULL DEFAULT 1,
      face_match_confident INTEGER NOT NULL DEFAULT 1
    )
  ''');

  static Future<void> _onUpgrade(Database db, int from, int to) async {
    // Version 1 identities passed every check, so they default to confirmed.
    if (from < 2) {
      await db.execute(
        'ALTER TABLE $verifiedIdentityTable ADD COLUMN '
        'date_of_birth_confirmed INTEGER NOT NULL DEFAULT 1',
      );
      await db.execute(
        'ALTER TABLE $verifiedIdentityTable ADD COLUMN '
        'face_match_confident INTEGER NOT NULL DEFAULT 1',
      );
    }
  }

  @disposeMethod
  Future<void> close() async {
    final database = _database;
    _database = null;
    await (await database)?.close();
  }
}
