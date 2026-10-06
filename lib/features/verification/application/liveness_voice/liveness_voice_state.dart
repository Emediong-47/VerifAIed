part of 'liveness_voice_bloc.dart';

@freezed
abstract class LivenessVoiceState with _$LivenessVoiceState {
  const factory LivenessVoiceState({
    @Default(false) bool muted,

    /// The most recent prompt spoken aloud.
    String? lastSpoken,
  }) = _LivenessVoiceState;
}
