import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/app/routes/app_router.dart';

@RoutePage()
class GuestWelcomePage extends StatelessWidget {
  const GuestWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Guest',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.router.push(PersonalDetailsRoute());
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
