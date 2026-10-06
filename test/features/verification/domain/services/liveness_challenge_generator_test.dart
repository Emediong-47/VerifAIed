import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';
import 'package:verif_aled/features/verification/domain/services/liveness_challenge_generator.dart';

void main() {
  test('generates two different challenges', () {
    // Arrange
    final generator = LivenessChallengeGenerator(Random(1));

    // Act
    final challenges = generator.generate();

    // Assert
    expect(challenges, hasLength(LivenessChallengeGenerator.challengeCount));
    expect(challenges.toSet(), hasLength(2));
    expect(LivenessAction.values, containsAll(challenges));
  });

  test('which challenges are picked depends on the random source', () {
    // Arrange
    final picks = <String>{};

    // Act
    for (var seed = 0; seed < 20; seed++) {
      picks.add(LivenessChallengeGenerator(Random(seed)).generate().join());
    }

    // Assert
    expect(picks.length, greaterThan(3));
  });

  test('every action can be picked', () {
    // Arrange
    final seen = <LivenessAction>{};

    // Act
    for (var seed = 0; seed < 50; seed++) {
      seen.addAll(LivenessChallengeGenerator(Random(seed)).generate());
    }

    // Assert
    expect(seen, LivenessAction.values.toSet());
  });
}
