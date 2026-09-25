import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';

class LivenessCheck {
  LivenessCheck({
    required this.challenges,
    required this.currentChallenge,
    required this.completedChallenges,
  });

  final List<LivenessAction> challenges;
  final LivenessAction currentChallenge;
  final List<LivenessAction> completedChallenges;
}
