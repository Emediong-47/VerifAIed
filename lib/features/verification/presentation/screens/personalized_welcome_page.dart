import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PersonalizedWelcomePage extends StatelessWidget {
  const PersonalizedWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi, Simon Ituen 👋'),
        //TODO: Add leading Image
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('First Name: Simon'),
            Text('Middle Name: Force'),
            Text('Last Name: Ituen'),
            Text('Means of Verification: NIN'),
            SizedBox(height: 4,),

          ],
        ),
      ),
    );
  }
}
