import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/widgets/app_animation.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/core/widgets/message_banner.dart';
import 'package:verif_aled/features/verification/application/document_capture/document_capture_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';

class CaptureDocumentWidget extends StatelessWidget {
  const CaptureDocumentWidget({super.key});

  static const _tips = [
    (Icons.crop_free_rounded, 'Keep all four corners inside the photo'),
    (Icons.wb_sunny_outlined, 'Use even light and avoid glare'),
    (Icons.texture_rounded, 'Place the card on a plain, dark surface'),
  ];

  @override
  Widget build(BuildContext context) {
    final documentLabel =
        context.read<VerificationSessionBloc>().state.documentType?.label ??
        'document';
    final theme = Theme.of(context);

    return BlocConsumer<DocumentCaptureBloc, DocumentCaptureState>(
      listenWhen: (_, current) => current is Captured,
      listener: (context, state) {
        final captured = state as Captured;
        context.read<VerificationSessionBloc>().add(
          VerificationSessionEvent.documentCaptured(captured.documentImage),
        );
        context.router.push(const DocumentVerificationRoute());
      },
      builder: (context, state) {
        final capturing = state is Capturing;

        return FlowScaffold(
          title: 'Capture Document',
          step: 3,
          heading: 'Photograph your $documentLabel',
          subtitle: 'We read your name and date of birth from the front.',
          actions: [
            FilledButton.icon(
              onPressed: capturing
                  ? null
                  : () => context.read<DocumentCaptureBloc>().add(
                      const DocumentCaptureEvent.captureRequested(),
                    ),
              icon: capturing
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.photo_camera_outlined),
              label: const Text('Capture'),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: AppAnimation(
                  AppAnimations.scanning,
                  semanticLabel: 'An ID card being scanned',
                  size: 200,
                ),
              ),
              const SizedBox(height: 16),
              for (final (icon, tip) in _tips)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(icon, color: theme.colorScheme.primary),
                  title: Text(tip),
                ),
              if (state case CaptureFailed(
                :final failure,
              ) when failure is! CaptureCancelled) ...[
                const SizedBox(height: 16),
                MessageBanner(message: failure.message),
              ],
            ],
          ),
        );
      },
    );
  }
}
