import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/infrastructure/capture_store.dart';

import '../../../helpers/fixed_clock.dart';

void main() {
  late Directory storage;
  late Directory cache;
  late int micros;
  late CaptureStore store;

  setUp(() {
    storage = Directory.systemTemp.createTempSync('capture_store');
    cache = Directory(p.join(storage.path, 'cache'))..createSync();
    micros = 1;
    store = CaptureStore(
      _CountingClock(() => micros++),
      directory: () async => storage,
    );
  });

  tearDown(() => storage.deleteSync(recursive: true));

  DocumentImage cachedPhoto(String name) {
    final file = File(p.join(cache.path, name))..writeAsBytesSync([1, 2, 3]);
    return DocumentImage(path: file.path);
  }

  test('moves the photo out of the cache into app storage', () async {
    // Arrange
    final photo = cachedPhoto('CAP123.jpg');

    // Act
    final kept = await store.keep(photo, CaptureKind.selfie);

    // Assert
    expect(
      kept.path,
      p.join(storage.path, CaptureStore.folder, 'selfie_1.jpg'),
    );
    expect(File(kept.path).readAsBytesSync(), [1, 2, 3]);
    expect(File(photo.path).existsSync(), isFalse);
  });

  test('a new photo replaces the earlier one of the same kind', () async {
    // Arrange
    final first = await store.keep(cachedPhoto('a.jpg'), CaptureKind.selfie);

    // Act
    final second = await store.keep(cachedPhoto('b.jpg'), CaptureKind.selfie);

    // Assert
    expect(File(first.path).existsSync(), isFalse);
    expect(File(second.path).existsSync(), isTrue);
    expect(second.path, isNot(first.path));
  });

  test('photos of different kinds are kept side by side', () async {
    // Arrange
    final document = await store.keep(
      cachedPhoto('doc.jpg'),
      CaptureKind.document,
    );

    // Act
    final selfie = await store.keep(cachedPhoto('me.jpg'), CaptureKind.selfie);

    // Assert
    expect(File(document.path).existsSync(), isTrue);
    expect(File(selfie.path).existsSync(), isTrue);
  });

  test('a missing source photo throws FileSystemException', () async {
    // Arrange
    final missing = DocumentImage(path: p.join(cache.path, 'gone.jpg'));

    // Act
    final keep = store.keep(missing, CaptureKind.document);

    // Assert
    await expectLater(keep, throwsA(isA<FileSystemException>()));
  });
}

class _CountingClock extends FixedClock {
  _CountingClock(this._next) : super(DateTime(0));

  final int Function() _next;

  @override
  DateTime now() => DateTime.fromMicrosecondsSinceEpoch(_next());
}
