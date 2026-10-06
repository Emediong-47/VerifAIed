import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/widgets/app_animation.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/core/widgets/message_banner.dart';
import 'package:verif_aled/core/widgets/status_colors.dart';
import 'package:verif_aled/features/verification/application/face_verification/face_verification_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';

@RoutePage()
class FaceVerificationPage extends StatelessWidget {
  const FaceVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.read<VerificationSessionBloc>().state;
    final documentImage = session.documentImage;
    final selfie = session.selfie;

    if (documentImage == null || selfie == null) {
      return const FlowScaffold(
        title: 'Face Verification',
        child: MessageBanner(message: 'Verification photos are missing.'),
      );
    }

    return BlocProvider(
      create: (_) => getIt<FaceVerificationBloc>()
        ..add(
          FaceVerificationEvent.started(
            documentImage: documentImage,
            selfie: selfie,
          ),
        ),
      child: BlocConsumer<FaceVerificationBloc, FaceVerificationState>(
        listenWhen: (_, current) => current is FaceVerified,
        listener: (context, state) {
          context.read<VerificationSessionBloc>().add(
            VerificationSessionEvent.faceVerified(
              (state as FaceVerified).verification,
            ),
          );
        },
        builder: (context, state) {
          final compared = state is FaceVerified;
          final weakMatch = switch (state) {
            FaceVerified(:final verification) => !verification.isConfidentMatch,
            _ => false,
          };
          final finished =
              state is FaceVerified || state is FaceVerificationFailed;

          return FlowScaffold(
            title: 'Face Verification',
            step: 5,
            heading: finished ? 'Face comparison' : 'Comparing faces…',
            subtitle: 'Matching your selfie with the photo on your ID.',
            actions: [
              if (compared) ...[
                FilledButton(
                  onPressed: () =>
                      context.router.push(const VerificationResultRoute()),
                  child: const Text('Continue'),
                ),
                // A clearer selfie may lift a weak match, but it is optional.
                if (weakMatch)
                  OutlinedButton.icon(
                    onPressed: () => context.router.maybePop(),
                    icon: const Icon(Icons.face_retouching_natural),
                    label: const Text('Retake selfie'),
                  ),
              ] else if (finished) ...[
                FilledButton.icon(
                  onPressed: () => context.router.maybePop(),
                  icon: const Icon(Icons.face_retouching_natural),
                  label: const Text('Retake selfie'),
                ),
                OutlinedButton.icon(
                  onPressed: () => context.router.popUntilRouteWithName(
                    CaptureDocumentRoute.name,
                  ),
                  icon: const Icon(Icons.badge_outlined),
                  label: const Text('Retake document'),
                ),
              ],
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _Photo(image: documentImage, label: 'ID photo'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.compare_arrows_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Expanded(
                      child: _Photo(image: selfie, label: 'Selfie'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                switch (state) {
                  FaceVerificationInitial() || FaceVerifying() => const Center(
                    child: AppAnimation(
                      AppAnimations.scanning,
                      semanticLabel: 'Comparing faces',
                      size: 140,
                    ),
                  ),
                  FaceVerified(:final verification) => _MatchResult(
                    verification: verification,
                  ),
                  FaceVerificationFailed(:final failure, :final photo) =>
                    MessageBanner(
                      message:
                          '${photo == FacePhoto.document ? 'Could not use the face on the document photo.' : 'Could not use the face in the selfie.'} '
                          '${failure.message}',
                    ),
                },
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({required this.image, required this.label});

  final DocumentImage image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Image.file(
              File(image.path),
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const ColoredBox(
                color: Colors.black12,
                child: Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}

class _MatchResult extends StatelessWidget {
  const _MatchResult({required this.verification});

  final FaceVerification verification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final confident = verification.isConfidentMatch;
    final colors = StatusColors.of(context);
    final color = confident ? colors.success : colors.warning;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  confident ? Icons.check_circle_rounded : Icons.error_rounded,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(
                  confident ? 'Faces match' : 'Weak face match',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: verification.similarity.clamp(0, 1),
              minHeight: 10,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              'Similarity: ${(verification.similarity * 100).toStringAsFixed(0)}%',
            ),
            if (!confident) ...[
              const SizedBox(height: 8),
              Text(
                'The photo on your ID may not be clear enough to compare. '
                'You can still continue; this will be noted in your result.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
