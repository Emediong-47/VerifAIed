import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/features/verification/infrastructure/flutter_tts_speech_repository.dart';

class MockFlutterTts extends Mock implements FlutterTts {}

void main() {
  late MockFlutterTts tts;
  late FlutterTtsSpeechRepository repository;

  setUpAll(() => registerFallbackValue(IosTextToSpeechAudioCategory.playback));

  setUp(() {
    tts = MockFlutterTts();
    when(() => tts.awaitSpeakCompletion(any())).thenAnswer((_) async => 1);
    when(() => tts.setLanguage(any())).thenAnswer((_) async => 1);
    when(() => tts.setSpeechRate(any())).thenAnswer((_) async => 1);
    when(
      () => tts.setIosAudioCategory(any(), any()),
    ).thenAnswer((_) async => 1);
    when(() => tts.stop()).thenAnswer((_) async => 1);
    when(() => tts.speak(any())).thenAnswer((_) async => 1);
    repository = FlutterTtsSpeechRepository(tts);
  });

  test('configures the voice once, before the first prompt', () async {
    // Arrange
    const first = 'Look left.';
    const second = 'Good job, now smile.';

    // Act
    await repository.speak(first);
    await repository.speak(second);

    // Assert
    verify(() => tts.awaitSpeakCompletion(false)).called(1);
    verify(() => tts.setLanguage('en-US')).called(1);
    verify(
      () => tts.setSpeechRate(FlutterTtsSpeechRepository.speechRate),
    ).called(1);
  });

  test('cuts off the previous prompt before speaking', () async {
    // Arrange
    const prompt = 'Look right.';

    // Act
    await repository.speak(prompt);

    // Assert
    verifyInOrder([() => tts.stop(), () => tts.speak(prompt)]);
  });

  test(
    'a speech engine error is swallowed and configuration retried',
    () async {
      // Arrange
      when(() => tts.setLanguage(any())).thenThrow(Exception('no engine'));

      // Act
      await repository.speak('Look up.');
      when(() => tts.setLanguage(any())).thenAnswer((_) async => 1);
      await repository.speak('Look up.');

      // Assert
      verify(() => tts.setLanguage('en-US')).called(2);
      verify(() => tts.speak('Look up.')).called(1);
    },
  );

  test('stop silences the voice and ignores engine errors', () async {
    // Arrange
    when(() => tts.stop()).thenThrow(Exception('no engine'));

    // Act
    Future<void> stop() => repository.stop();

    // Assert
    await expectLater(stop(), completes);
  });
}
