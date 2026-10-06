import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/infrastructure/capture_store.dart';
import 'package:verif_aled/features/verification/infrastructure/image_picker_document_capture_repository.dart';

class MockImagePicker extends Mock implements ImagePicker {}

class MockCaptureStore extends Mock implements CaptureStore {}

void main() {
  late MockImagePicker picker;
  late MockCaptureStore captures;
  late ImagePickerDocumentCaptureRepository repository;

  setUp(() {
    picker = MockImagePicker();
    captures = MockCaptureStore();
    repository = ImagePickerDocumentCaptureRepository(picker, captures);
  });

  test('moves the captured photo out of the cache and returns it', () async {
    // Arrange
    when(
      () => picker.pickImage(source: ImageSource.camera),
    ).thenAnswer((_) async => XFile('/cache/nin.jpg'));
    when(
      () => captures.keep(
        const DocumentImage(path: '/cache/nin.jpg'),
        CaptureKind.document,
      ),
    ).thenAnswer(
      (_) async =>
          const DocumentImage(path: '/support/captures/document_1.jpg'),
    );

    // Act
    final result = await repository.captureFromCamera();

    // Assert
    expect(
      result,
      isA<Ok<DocumentImage>>().having(
        (r) => r.value,
        'value',
        const DocumentImage(path: '/support/captures/document_1.jpg'),
      ),
    );
  });

  test('returns CaptureFailure when the photo cannot be stored', () async {
    // Arrange
    when(
      () => picker.pickImage(source: ImageSource.camera),
    ).thenAnswer((_) async => XFile('/cache/nin.jpg'));
    when(
      () => captures.keep(
        const DocumentImage(path: '/cache/nin.jpg'),
        CaptureKind.document,
      ),
    ).thenThrow(const FileSystemException('disk full'));

    // Act
    final result = await repository.captureFromCamera();

    // Assert
    expect(
      result,
      isA<Err<DocumentImage>>().having(
        (r) => r.failure,
        'failure',
        isA<CaptureFailure>(),
      ),
    );
  });

  test('returns CaptureCancelled when the picker returns null', () async {
    // Arrange
    when(
      () => picker.pickImage(source: ImageSource.camera),
    ).thenAnswer((_) async => null);

    // Act
    final result = await repository.captureFromCamera();

    // Assert
    expect(
      result,
      isA<Err<DocumentImage>>().having(
        (r) => r.failure,
        'failure',
        isA<CaptureCancelled>(),
      ),
    );
  });

  test('returns CaptureFailure when the picker throws', () async {
    // Arrange
    when(
      () => picker.pickImage(source: ImageSource.camera),
    ).thenThrow(Exception('no camera'));

    // Act
    final result = await repository.captureFromCamera();

    // Assert
    expect(
      result,
      isA<Err<DocumentImage>>().having(
        (r) => r.failure,
        'failure',
        isA<CaptureFailure>().having(
          (f) => f.message,
          'message',
          contains('no camera'),
        ),
      ),
    );
  });
}
