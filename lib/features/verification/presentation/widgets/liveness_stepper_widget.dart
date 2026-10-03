import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps/flutter_steps.dart';
import 'package:verif_aled/app/routes/app_router.dart';

class LivenessStepperWidget extends StatefulWidget {
  const LivenessStepperWidget({super.key});

  @override
  State<LivenessStepperWidget> createState() => _LivenessStepperWidgetState();
}

class _LivenessStepperWidgetState extends State<LivenessStepperWidget> {
  String? _title;
  final _stepController = FlutterStepsController(initialStep: 0);
  final _steps = [
    Steps(title: 'Look Left', subtitle: 'Step 1'),
    Steps(title: 'Look Right', subtitle: 'Step 2'),
    Steps(title: 'Look Up', subtitle: 'Step 3'),
    Steps(title: 'Look Down', subtitle: 'Step 4'),
    Steps(title: 'Open Mouth', subtitle: 'Step 5'),
  ];

  @override
  void dispose() {
    _stepController.dispose();
    super.dispose();
  }

  void _completeCurrentAction() {
    _stepController.next(_steps.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: FlutterSteps(
            steps: _steps,
            controller: _stepController,
            direction: Axis.horizontal,
            showSubtitle: false,
            showCounter: true,
            showStepLine: true,
            titleFontSize: 10,
            leadingSize: 28,
            onStepChanged: (step) {
              setState(() {});
            },
          ),
        ),

        const Spacer(),

        Text(
          'Look Left',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        Container(
          height: 350,
          width: double.infinity,
          color: Colors.black12,
          child: const Center(child: Text('Camera Preview')),
        ),

        const Spacer(),

        ElevatedButton(
          onPressed: () => context.router.push(VerificationResultRoute()),
          child: const Text('Completed'),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
