import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';

/// Picks random challenges so a recorded attempt cannot be replayed.
@injectable
class LivenessChallengeGenerator {
  LivenessChallengeGenerator(this._random);

  static const challengeCount = 2;

  final Random _random;

  List<LivenessAction> generate() => ([
    ...LivenessAction.values,
  ]..shuffle(_random)).take(challengeCount).toList();
}
