import 'package:flutter/material.dart';
import 'package:verif_aled/features/verification/domain/enums/liveness_action.dart';

extension LivenessActionUi on LivenessAction {
  IconData get icon => switch (this) {
    LivenessAction.lookLeft => Icons.arrow_back_rounded,
    LivenessAction.lookRight => Icons.arrow_forward_rounded,
    LivenessAction.lookUp => Icons.arrow_upward_rounded,
    LivenessAction.lookDown => Icons.arrow_downward_rounded,
    LivenessAction.smile => Icons.sentiment_very_satisfied_rounded,
  };
}
