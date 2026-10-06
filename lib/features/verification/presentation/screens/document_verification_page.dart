import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:verif_aled/app/routes/app_router.dart';

@RoutePage()
class DocumentVerificationPage extends StatefulWidget {
  const DocumentVerificationPage({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<DocumentVerificationPage> createState() => _DocumentVerificationPageState();
}

class _DocumentVerificationPageState extends State<DocumentVerificationPage> {

  FutureOr<void> beginTextRecognition() async{
    final inputImage = InputImage.fromFilePath(widget.imagePath);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        print(text);
        for (TextElement element in line.elements) {
          print(text);
        }
      }
    }
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Verification'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.imagePath.isNotEmpty)
                Card(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  margin: EdgeInsets.all(8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.file(File(widget.imagePath)),
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
