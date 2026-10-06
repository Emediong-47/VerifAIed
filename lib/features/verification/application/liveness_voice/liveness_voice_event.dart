part of 'liveness_voice_bloc.dart';

@freezed
sealed class LivenessVoiceEvent with _$LivenessVoiceEvent {
  /// The liveness check moved to [state].
  const factory LivenessVoiceEvent.livenessChanged(LivenessState state) =
      LivenessChanged;

  const factory LivenessVoiceEvent.muteToggled() = MuteToggled;
}
