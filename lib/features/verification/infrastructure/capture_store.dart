import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:verif_aled/core/utils/clock.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

/// What a captured photo is of. Only the latest photo of each kind is kept.
enum CaptureKind { document, selfie }

/// Moves camera photos out of the cache folder into app storage. Android, and
/// phone cleaners such as Transsion's Phone Master, may empty the cache while
/// the flow still needs the photos.
@lazySingleton
class CaptureStore {
  CaptureStore(
    this._clock, {
    @ignoreParam Future<Directory> Function()? directory,
  }) : _directory = directory ?? getApplicationSupportDirectory;

  static const folder = 'captures';

  final Clock _clock;
  final Future<Directory> Function() _directory;

  /// Moves [photo] into app storage and deletes the earlier photo of the same
  /// [kind]. Each photo gets a new name so the image cache never shows an
  /// earlier one.
  Future<DocumentImage> keep(DocumentImage photo, CaptureKind kind) async {
    final directory = Directory(p.join((await _directory()).path, folder));
    await directory.create(recursive: true);
    final prefix = '${kind.name}_';
    final target = p.join(
      directory.path,
      '$prefix${_clock.now().microsecondsSinceEpoch}'
      '${p.extension(photo.path)}',
    );

    await for (final old in directory.list()) {
      if (old is File && p.basename(old.path).startsWith(prefix)) {
        await old.delete();
      }
    }
    await _move(File(photo.path), target);
    return DocumentImage(path: target);
  }

  static Future<void> _move(File source, String target) async {
    try {
      await source.rename(target);
    } on FileSystemException {
      // Rename cannot cross file systems.
      await source.copy(target);
      await source.delete();
    }
  }
}
