import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/app/routes/app_router.dart';

@RoutePage()
class VerificationResultPage extends StatelessWidget {
  const VerificationResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification Result')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.router.push(PersonalizedWelcomeRoute()),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
