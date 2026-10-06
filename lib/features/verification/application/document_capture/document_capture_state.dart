part of 'document_capture_bloc.dart';

@freezed
sealed class DocumentCaptureState with _$DocumentCaptureState {
  const factory DocumentCaptureState.initial() = CaptureInitial;
  const factory DocumentCaptureState.capturing() = Capturing;
  const factory DocumentCaptureState.captured(DocumentImage documentImage) =
      Captured;
  const factory DocumentCaptureState.failure(Failure failure) = CaptureFailed;
}
