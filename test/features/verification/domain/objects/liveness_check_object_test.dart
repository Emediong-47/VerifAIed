import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';
import 'package:verif_aled/features/verification/domain/objects/liveness_check_object.dart';

void main() {
  const challenges = [LivenessAction.lookLeft, LivenessAction.smile];

  test('a new check starts at the first challenge', () {
    // Arrange & Act
    const check = LivenessCheck(challenges: challenges);

    // Assert
    expect(check.currentChallenge, LivenessAction.lookLeft);
    expect(check.isComplete, isFalse);
  });

  test('complete moves to the next challenge', () {
    // Arrange
    const check = LivenessCheck(challenges: challenges);

    // Act
    final next = check.complete();

    // Assert
    expect(next.completedChallenges, [LivenessAction.lookLeft]);
    expect(next.currentChallenge, LivenessAction.smile);
  });

  test('completing every challenge completes the check', () {
    // Arrange
    const check = LivenessCheck(challenges: challenges);

    // Act
    final next = check.complete().complete();

    // Assert
    expect(next.isComplete, isTrue);
    expect(next.currentChallenge, isNull);
  });

  test('restart clears progress but keeps the challenges', () {
    // Arrange
    final check = const LivenessCheck(challenges: challenges).complete();

    // Act
    final restarted = check.restart();

    // Assert
    expect(restarted, const LivenessCheck(challenges: challenges));
  });
}
