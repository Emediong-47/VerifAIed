part of 'liveness_bloc.dart';

@freezed
sealed class LivenessEvent with _$LivenessEvent {
  const factory LivenessEvent.started() = LivenessStarted;
  const factory LivenessEvent.facesDetected(List<FaceObservation> faces) =
      FacesDetected;
}
