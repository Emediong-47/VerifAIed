sealed class Failure {
  const Failure(this.message);

  final String message;
}

class CaptureCancelled extends Failure {
  const CaptureCancelled() : super('Capture was cancelled');
}

class CaptureFailure extends Failure {
  const CaptureFailure(super.message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}

class TextRecognitionFailure extends Failure {
  const TextRecognitionFailure(super.message);
}

class CameraFailure extends Failure {
  const CameraFailure(super.message);
}

class NoFaceDetected extends Failure {
  const NoFaceDetected() : super('No face was found in the photo');
}

class FaceProcessingFailure extends Failure {
  const FaceProcessingFailure(super.message);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}
