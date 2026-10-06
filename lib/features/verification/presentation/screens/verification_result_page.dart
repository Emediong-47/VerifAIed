import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/widgets/app_animation.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/core/widgets/status_tile.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';
import 'package:verif_aled/features/verification/application/session/verification_session_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/check_status.dart';
import 'package:verif_aled/features/verification/domain/objects/verification_summary_object.dart';
import 'package:verif_aled/features/verification/presentation/start_again.dart';

@RoutePage()
class VerificationResultPage extends StatelessWidget {
  const VerificationResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final session = context.watch<VerificationSessionBloc>().state;
    final summary = session.summary;
    final similarity = session.faceVerification?.similarity;

    StatusTile tile(CheckStatus status, String label, {String? detail}) =>
        StatusTile(
          label: label,
          passed: switch (status) {
            CheckStatus.passed || CheckStatus.passedWithWarning => true,
            CheckStatus.failed => false,
            CheckStatus.notCompleted => null,
          },
          warning: status == CheckStatus.passedWithWarning,
          detail: detail,
        );
    final similarityText = similarity == null
        ? null
        : 'Similarity ${(similarity * 100).toStringAsFixed(0)}%';

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == AuthStatus.authenticated,
          listener: (context, state) async {
            final sessionBloc = context.read<VerificationSessionBloc>();
            await context.router.replaceAll([const PersonalizedWelcomeRoute()]);
            // The identity is stored now, so the flow data can go.
            sessionBloc.add(const VerificationSessionEvent.reset());
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              current.failure != null && current.failure != previous.failure,
          listener: (context, state) =>
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Could not save your verification: '
                    '${state.failure!.message}',
                  ),
                ),
              ),
        ),
      ],
      child: FlowScaffold(
        title: 'Verification Result',
        actions: [
          if (summary.isVerified)
            FilledButton(
              onPressed: () => context.read<AuthBloc>().add(
                AuthEvent.verificationCompleted(
                  applicant: session.applicant!,
                  documentType: session.documentType!,
                  selfie: session.selfie!,
                  faceSimilarity: similarity!,
                  isDateOfBirthConfirmed:
                      summary.document == CheckStatus.passed,
                  isFaceMatchConfident: summary.face == CheckStatus.passed,
                ),
              ),
              child: const Text('Continue'),
            )
          else
            FilledButton.icon(
              onPressed: () => startAgain(context),
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text('Start again'),
            ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: AppAnimation(
                summary.isVerified
                    ? AppAnimations.success
                    : AppAnimations.failure,
                semanticLabel: summary.isVerified
                    ? 'Verification succeeded'
                    : 'Verification did not succeed',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              switch (summary) {
                VerificationSummary(isVerified: false) =>
                  'Verification incomplete',
                VerificationSummary(hasWarnings: true) =>
                  'Identity verified with warnings',
                _ => 'Identity verified',
              },
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              switch (summary) {
                VerificationSummary(isVerified: false) =>
                  'Some checks did not pass. You can start again.',
                VerificationSummary(hasWarnings: true) =>
                  'Some results could not be fully confirmed, but you can '
                      'still continue to finish signing in.',
                _ => 'All checks passed. Continue to finish signing in.',
              },
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  tile(
                    summary.document,
                    'Document check',
                    detail: summary.document == CheckStatus.passedWithWarning
                        ? 'Date of birth not found on the document'
                        : null,
                  ),
                  tile(summary.liveness, 'Liveness check'),
                  tile(
                    summary.face,
                    'Face match',
                    detail: summary.face == CheckStatus.passedWithWarning
                        ? '$similarityText · ID photo may be unclear'
                        : similarityText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
