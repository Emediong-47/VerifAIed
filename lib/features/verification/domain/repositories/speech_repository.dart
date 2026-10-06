abstract interface class SpeechRepository {
  Future<void> speak(String text);

  Future<void> stop();
}
