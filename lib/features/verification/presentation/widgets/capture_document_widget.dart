import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:verif_aled/app/routes/app_router.dart';

class CaptureDocumentWidget extends StatefulWidget {
  const CaptureDocumentWidget({super.key});

  @override
  State<CaptureDocumentWidget> createState() => _CaptureDocumentWidgetState();
}

class _CaptureDocumentWidgetState extends State<CaptureDocumentWidget> {
  String? capturedImage;

  void _captureImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? processedImage = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (processedImage == null || !context.mounted) return;
    setState(() {
      capturedImage = processedImage.path;
    });
    context.router.push(
      DocumentVerificationRoute(imagePath: capturedImage ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: ElevatedButton(
          onPressed: () {
            _captureImage(context);
          },
          child: const Text('Capture'),
        ),
      ),
    );
  }
}
