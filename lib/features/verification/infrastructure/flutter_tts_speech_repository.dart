import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/features/verification/domain/repositories/speech_repository.dart';

/// Speaks with the device's built-in text-to-speech voice.
@LazySingleton(as: SpeechRepository)
class FlutterTtsSpeechRepository implements SpeechRepository {
  FlutterTtsSpeechRepository(this._tts);

  /// A little slower than the platform default, so instructions are easy to
  /// follow while moving.
  static const speechRate = 0.45;

  final FlutterTts _tts;
  Future<void>? _configured;

  Future<void> _configure() async {
    await _tts.awaitSpeakCompletion(false);
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(speechRate);
    // Play over the silent switch and duck music rather than stopping it.
    await _tts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
      IosTextToSpeechAudioCategoryOptions.duckOthers,
    ]);
  }

  @override
  Future<void> speak(String text) async {
    try {
      await (_configured ??= _configure());
      await _tts.stop();
      await _tts.speak(text);
    } catch (e) {
      // Allow configuration to be retried on the next prompt.
      _configured = null;
      debugPrint('Speech unavailable: $e');
    }
  }

  @override
  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (e) {
      debugPrint('Speech unavailable: $e');
    }
  }
}
