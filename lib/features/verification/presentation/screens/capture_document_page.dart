import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/features/verification/application/document_capture/document_capture_bloc.dart';
import 'package:verif_aled/features/verification/presentation/widgets/capture_document_widget.dart';

@RoutePage()
class CaptureDocumentPage extends StatelessWidget {
  const CaptureDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DocumentCaptureBloc>(),
      child: const CaptureDocumentWidget(),
    );
  }
}
