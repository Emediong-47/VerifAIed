import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/features/verification/presentation/widgets/liveness_stepper_widget.dart';

@RoutePage()
class LivenessCheckPage extends StatelessWidget {
  const LivenessCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liveness Check')),
      body: LivenessStepperWidget(),
    );
  }
}
