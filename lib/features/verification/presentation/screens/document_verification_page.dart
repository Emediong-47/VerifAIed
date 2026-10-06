import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/utils/date_format.dart';
import 'package:verif_aled/core/widgets/app_animation.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/core/widgets/message_banner.dart';
import 'package:verif_aled/core/widgets/status_tile.dart';
import 'package:verif_aled/features/verification/application/document_verification/document_verification_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';

@RoutePage()
class DocumentVerificationPage extends StatelessWidget {
  const DocumentVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.read<VerificationSessionBloc>().state;
    final applicant = session.applicant;
    final documentType = session.documentType;
    final documentImage = session.documentImage;

    if (applicant == null || documentType == null || documentImage == null) {
      return const FlowScaffold(
        title: 'Document Verification',
        child: MessageBanner(message: 'Verification details are missing.'),
      );
    }

    return BlocProvider(
      create: (_) => getIt<DocumentVerificationBloc>()
        ..add(
          DocumentVerificationEvent.started(
            applicant: applicant,
            documentType: documentType,
            documentImage: documentImage,
          ),
        ),
      child: BlocConsumer<DocumentVerificationBloc, DocumentVerificationState>(
        listenWhen: (_, current) => current is Verified,
        listener: (context, state) {
          context.read<VerificationSessionBloc>().add(
            VerificationSessionEvent.documentVerified(
              (state as Verified).verification,
            ),
          );
        },
        builder: (context, state) {
          final busy = state is VerificationInitial || state is Verifying;
          final passed = switch (state) {
            Verified(:final verification) => verification.isSuccessful,
            _ => false,
          };

          return FlowScaffold(
            title: 'Document Verification',
            step: 3,
            heading: busy ? 'Reading your document…' : 'Document checked',
            actions: [
              if (passed)
                FilledButton(
                  onPressed: () =>
                      context.router.push(const LivenessCheckRoute()),
                  child: const Text('Continue'),
                ),
              if (!busy)
                OutlinedButton.icon(
                  onPressed: () => context.router.maybePop(),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Retake'),
                ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 1.6,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(documentImage.path),
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const ColoredBox(
                            color: Colors.black12,
                            child: Icon(Icons.image_not_supported_outlined),
                          ),
                        ),
                        if (busy)
                          ColoredBox(
                            color: Theme.of(
                              context,
                            ).colorScheme.surface.withValues(alpha: 0.7),
                            child: const Center(
                              child: AppAnimation(
                                AppAnimations.scanning,
                                semanticLabel: 'Reading the document',
                                size: 140,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                switch (state) {
                  VerificationInitial() ||
                  Verifying() => const SizedBox.shrink(),
                  Verified(:final verification) => _VerificationChecks(
                    verification: verification,
                    documentLabel: documentType.label,
                  ),
                  VerificationFailed(:final failure) => MessageBanner(
                    message: 'Could not read the document: ${failure.message}',
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

class _VerificationChecks extends StatelessWidget {
  const _VerificationChecks({
    required this.verification,
    required this.documentLabel,
  });

  final DocumentVerification verification;
  final String documentLabel;

  @override
  Widget build(BuildContext context) {
    final dateOfBirth = verification.extractedDateOfBirth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Column(
            children: [
              StatusTile(
                label: 'Document is a $documentLabel',
                passed: verification.isDocumentTypeMatch,
              ),
              StatusTile(
                label: 'Name matches',
                passed: verification.isNameMatch,
              ),
              if (dateOfBirth == null)
                const StatusTile(
                  label: 'Date of birth',
                  passed: true,
                  warning: true,
                  detail: 'Not found on the document',
                )
              else
                StatusTile(
                  label: 'Date of birth matches',
                  passed: verification.isDateOfBirthMatch,
                  detail: 'Read as ${formatDate(dateOfBirth)}',
                ),
            ],
          ),
        ),
        if (verification.hasWarning) ...[
          const SizedBox(height: 16),
          const MessageBanner(
            message:
                'This document does not show a date of birth, so it could '
                'not be confirmed. You can still continue; this will be '
                'noted in your result.',
            icon: Icons.info_outline_rounded,
            isError: false,
          ),
        ],
        if (!verification.isFaceDetected) ...[
          const SizedBox(height: 16),
          const MessageBanner(
            message:
                "We couldn't find a face on your ID photo. Retake the photo "
                'so the picture on the card is sharp and free of glare.',
          ),
        ] else if (!verification.isSuccessful) ...[
          const SizedBox(height: 16),
          const MessageBanner(
            message:
                'Some details did not match. Retake the photo in better '
                'light, or check the details you entered.',
          ),
        ],
      ],
    );
  }
}
