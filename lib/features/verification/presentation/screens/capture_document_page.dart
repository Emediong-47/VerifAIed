import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/features/verification/presentation/widgets/capture_document_widget.dart';

@RoutePage()
class CaptureDocumentPage extends StatelessWidget {
  const CaptureDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Document'),
      ),
      body: const CaptureDocumentWidget(),
    );
  }
}
