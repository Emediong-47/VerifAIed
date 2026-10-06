import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:verif_aled/core/utils/clock.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

/// Keeps the signed-in user's selfie in app storage. Camera photos live in a
/// cache folder the system may clear.
@lazySingleton
class SelfieStore {
  SelfieStore(
    this._clock, {
    @ignoreParam Future<Directory> Function()? directory,
  }) : _directory = directory ?? getApplicationDocumentsDirectory;

  static const folder = 'identity';

  final Clock _clock;
  final Future<Directory> Function() _directory;

  /// Copies [selfie] into app storage. Each copy gets a new name so the
  /// image cache never shows an earlier user's photo.
  Future<DocumentImage> persist(DocumentImage selfie) async {
    final directory = Directory(p.join((await _directory()).path, folder));
    await directory.create(recursive: true);
    final target = p.join(
      directory.path,
      'selfie_${_clock.now().microsecondsSinceEpoch}'
      '${p.extension(selfie.path)}',
    );
    await File(selfie.path).copy(target);
    return DocumentImage(path: target);
  }

  Future<void> delete(DocumentImage selfie) async {
    final file = File(selfie.path);
    if (await file.exists()) await file.delete();
  }
}
