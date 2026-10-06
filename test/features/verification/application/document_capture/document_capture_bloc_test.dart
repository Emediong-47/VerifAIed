import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/application/document_capture/document_capture_bloc.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/document_capture_repository.dart';

class MockDocumentCaptureRepository extends Mock
    implements DocumentCaptureRepository {}

void main() {
  late MockDocumentCaptureRepository repository;
  late DocumentCaptureBloc bloc;

  setUp(() {
    repository = MockDocumentCaptureRepository();
    bloc = DocumentCaptureBloc(repository);
  });

  tearDown(() => bloc.close());

  test('initial state is initial', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state, const DocumentCaptureState.initial());
  });

  test(
    'emits capturing then captured when the camera returns an image',
    () async {
      // Arrange
      const image = DocumentImage(path: '/tmp/nin.jpg');
      when(
        () => repository.captureFromCamera(),
      ).thenAnswer((_) async => const Ok(image));
      final expectation = expectLater(
        bloc.stream,
        emitsInOrder(const [
          DocumentCaptureState.capturing(),
          DocumentCaptureState.captured(image),
        ]),
      );

      // Act
      bloc.add(const DocumentCaptureEvent.captureRequested());

      // Assert
      await expectation;
      verify(() => repository.captureFromCamera()).called(1);
    },
  );

  test(
    'emits capturing then cancelled failure when the user backs out',
    () async {
      // Arrange
      when(
        () => repository.captureFromCamera(),
      ).thenAnswer((_) async => const Err(CaptureCancelled()));
      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          const DocumentCaptureState.capturing(),
          isA<CaptureFailed>().having(
            (s) => s.failure,
            'failure',
            isA<CaptureCancelled>(),
          ),
        ]),
      );

      // Act
      bloc.add(const DocumentCaptureEvent.captureRequested());

      // Assert
      await expectation;
    },
  );

  test('emits capturing then capture failure when the camera errors', () async {
    // Arrange
    when(
      () => repository.captureFromCamera(),
    ).thenAnswer((_) async => const Err(CaptureFailure('camera busy')));
    final expectation = expectLater(
      bloc.stream,
      emitsInOrder([
        const DocumentCaptureState.capturing(),
        isA<CaptureFailed>().having(
          (s) => s.failure.message,
          'message',
          'camera busy',
        ),
      ]),
    );

    // Act
    bloc.add(const DocumentCaptureEvent.captureRequested());

    // Assert
    await expectation;
  });
}
