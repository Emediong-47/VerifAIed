import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';

part 'liveness_check_object.freezed.dart';

@freezed
abstract class LivenessCheck with _$LivenessCheck {
  const LivenessCheck._();

  const factory LivenessCheck({
    required List<LivenessAction> challenges,
    @Default([]) List<LivenessAction> completedChallenges,
  }) = _LivenessCheck;

  bool get isComplete => completedChallenges.length >= challenges.length;

  LivenessAction? get currentChallenge =>
      isComplete ? null : challenges[completedChallenges.length];

  LivenessCheck complete() => copyWith(
    completedChallenges: [...completedChallenges, currentChallenge!],
  );

  LivenessCheck restart() => copyWith(completedChallenges: []);
}
