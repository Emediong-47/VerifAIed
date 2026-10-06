import 'package:flutter/material.dart';
import 'package:flutter_steps/flutter_steps.dart';
import 'package:verif_aled/features/verification/domain/objects/liveness_check_object.dart';

/// Shows progress through the liveness challenges, then the final
/// hold-still step.
class LivenessStepperWidget extends StatefulWidget {
  const LivenessStepperWidget({super.key, required this.check});

  final LivenessCheck check;

  @override
  State<LivenessStepperWidget> createState() => _LivenessStepperWidgetState();
}

class _LivenessStepperWidgetState extends State<LivenessStepperWidget> {
  late final _stepController = FlutterStepsController(
    initialStep: _currentStep,
  );

  static const holdStillLabel = 'Hold still';

  int get _stepCount => widget.check.challenges.length + 1;

  // Once every challenge is done, the hold-still step is current.
  int get _currentStep =>
      widget.check.completedChallenges.length.clamp(0, _stepCount - 1);

  @override
  void didUpdateWidget(covariant LivenessStepperWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _stepController.jumpTo(_currentStep, _stepCount);
  }

  @override
  void dispose() {
    _stepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final challenges = widget.check.challenges;

    return FlutterSteps(
      steps: [
        for (final (index, action) in challenges.indexed)
          Steps(title: action.label, subtitle: 'Step ${index + 1}'),
        Steps(title: holdStillLabel, subtitle: 'Step ${challenges.length + 1}'),
      ],
      controller: _stepController,
      direction: Axis.horizontal,
      showSubtitle: false,
      showCounter: true,
      showStepLine: true,
      titleFontSize: 10,
      leadingSize: 28,
    );
  }
}
