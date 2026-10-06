import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/utils/clock.dart';
import 'package:verif_aled/features/verification/application/liveness/liveness_bloc.dart';
import 'package:verif_aled/features/verification/application/liveness_voice/liveness_voice_prompts.dart';
import 'package:verif_aled/features/verification/domain/repositories/speech_repository.dart';

part 'liveness_voice_event.dart';
part 'liveness_voice_state.dart';
part 'liveness_voice_bloc.freezed.dart';

/// Reads the liveness instructions aloud. App-scoped so muting lasts for
/// the rest of the session, including retries.
@lazySingleton
class LivenessVoiceBloc extends Bloc<LivenessVoiceEvent, LivenessVoiceState> {
  LivenessVoiceBloc(this._speech, this._clock)
    : super(const LivenessVoiceState()) {
    on<LivenessChanged>(_onLivenessChanged);
    on<MuteToggled>(_onMuteToggled);
  }

  /// Shortest gap between two guidance prompts, so a face hovering on the
  /// edge of a limit does not trigger a stream of corrections.
  static const guidanceInterval = Duration(seconds: 2);

  final SpeechRepository _speech;
  final Clock _clock;
  DateTime? _lastGuidanceAt;

  /// The liveness state the last prompt was decided from.
  LivenessState _previous = const LivenessState();

  Future<void> _onLivenessChanged(
    LivenessChanged event,
    Emitter<LivenessVoiceState> emit,
  ) async {
    final prompt = LivenessVoicePrompts.between(_previous, event.state);
    _previous = event.state;
    if (prompt == null || state.muted) return;

    final now = _clock.now();
    if (prompt.isGuidance) {
      final last = _lastGuidanceAt;
      if (last != null && now.difference(last) < guidanceInterval) return;
      _lastGuidanceAt = now;
    }

    await _speech.speak(prompt.text);
    emit(state.copyWith(lastSpoken: prompt.text));
  }

  Future<void> _onMuteToggled(
    MuteToggled event,
    Emitter<LivenessVoiceState> emit,
  ) async {
    final muted = !state.muted;
    if (muted) await _speech.stop();
    emit(state.copyWith(muted: muted));
  }
}
