import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/app/routes/app_router.dart';

@RoutePage()
class DocumentVerificationPage extends StatelessWidget {
  const DocumentVerificationPage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Verification'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              if (imagePath.isNotEmpty)
                Card(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  margin: EdgeInsets.all(8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.file(File(imagePath)),
                  ),
                ),
              Card(
                margin: EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.inversePrimary,
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Column(),
                ),
              ),
              const SizedBox(height: 8,),
              ElevatedButton(onPressed: () {
                context.router.push(const LivenessCheckRoute());
              }, child: const Text('Continue'))
            ],
          ),
        ),
      ),
    );
  }
}
