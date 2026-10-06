import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:verif_aled/features/auth/infrastructure/selfie_store.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

import '../../../helpers/fixed_clock.dart';

void main() {
  late Directory appStorage;
  late File cameraPhoto;
  late SelfieStore store;

  setUp(() {
    appStorage = Directory.systemTemp.createTempSync('app_storage');
    cameraPhoto = File(p.join(appStorage.path, 'cache', 'CAP123.jpg'))
      ..createSync(recursive: true)
      ..writeAsBytesSync([1, 2, 3]);
    store = SelfieStore(
      FixedClock(DateTime.fromMicrosecondsSinceEpoch(42)),
      directory: () async => appStorage,
    );
  });

  tearDown(() => appStorage.deleteSync(recursive: true));

  test('persist copies the selfie into the identity folder', () async {
    // Arrange
    final selfie = DocumentImage(path: cameraPhoto.path);

    // Act
    final stored = await store.persist(selfie);

    // Assert
    expect(
      stored.path,
      p.join(appStorage.path, SelfieStore.folder, 'selfie_42.jpg'),
    );
    expect(File(stored.path).readAsBytesSync(), [1, 2, 3]);
    expect(cameraPhoto.existsSync(), isTrue);
  });

  test('delete removes the stored selfie', () async {
    // Arrange
    final stored = await store.persist(DocumentImage(path: cameraPhoto.path));

    // Act
    await store.delete(stored);

    // Assert
    expect(File(stored.path).existsSync(), isFalse);
  });

  test('delete ignores a selfie that no longer exists', () async {
    // Arrange
    final missing = DocumentImage(path: p.join(appStorage.path, 'gone.jpg'));

    // Act
    Future<void> delete() => store.delete(missing);

    // Assert
    await expectLater(delete(), completes);
  });
}
