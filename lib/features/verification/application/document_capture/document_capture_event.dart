part of 'document_capture_bloc.dart';

@freezed
sealed class DocumentCaptureEvent with _$DocumentCaptureEvent {
  const factory DocumentCaptureEvent.captureRequested() = CaptureRequested;
}
