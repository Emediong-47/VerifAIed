import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verif_aled/core/utils/date_format.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/core/widgets/message_banner.dart';
import 'package:verif_aled/core/widgets/status_colors.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';
import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/auth/presentation/widgets/logout_dialog.dart';
import 'package:verif_aled/features/verification/presentation/start_again.dart';
import 'package:verif_aled/features/verification/presentation/widgets/document_type_ui.dart';
import 'package:verif_aled/features/verification/presentation/widgets/selfie_avatar.dart';

@RoutePage()
class PersonalizedWelcomePage extends StatelessWidget {
  const PersonalizedWelcomePage({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final auth = context.read<AuthBloc>();
    if (await showLogoutDialog(context)) {
      auth.add(const AuthEvent.logoutRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              previous.status == AuthStatus.authenticated &&
              current.status == AuthStatus.unauthenticated,
          listener: (context, state) => startAgain(context),
        ),
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              current.failure != null && current.failure != previous.failure,
          listener: (context, state) =>
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not log out: ${state.failure!.message}'),
                ),
              ),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final identity = state.identity;
          if (state.status != AuthStatus.authenticated || identity == null) {
            return FlowScaffold(
              title: 'Welcome',
              actions: [
                FilledButton(
                  onPressed: () => startAgain(context),
                  child: const Text('Start verification'),
                ),
              ],
              child: const MessageBanner(
                message: 'No verified identity yet.',
                icon: Icons.info_outline_rounded,
                isError: false,
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('VerifAIed'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout_rounded),
                  tooltip: 'Log out',
                  onPressed: () => _confirmLogout(context),
                ),
              ],
            ),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                children: [
                  _Header(identity: identity),
                  const SizedBox(height: 24),
                  if (identity.hasWarnings) ...[
                    _Warnings(identity: identity),
                    const SizedBox(height: 16),
                  ],
                  _Details(identity: identity),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: () => _confirmLogout(context),
                    icon: const Icon(Icons.logout_rounded),
                    label: const Text('Log out'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.identity});

  final VerifiedIdentity identity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = StatusColors.of(context);
    final (chipColor, chipIcon, chipLabel) = identity.hasWarnings
        ? (colors.warning, Icons.gpp_maybe_rounded, 'Verified with warnings')
        : (colors.success, Icons.verified_rounded, 'Verified identity');
    final name = identity.applicant.name;

    return Column(
      children: [
        SelfieAvatar(selfie: identity.selfie, radius: 56, verified: true),
        const SizedBox(height: 16),
        Text(
          'Hi, ${name.firstName} ${name.lastName} 👋',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Chip(
          avatar: Icon(chipIcon, color: chipColor, size: 18),
          label: Text(chipLabel),
          side: BorderSide(color: chipColor.withValues(alpha: 0.4)),
          backgroundColor: chipColor.withValues(alpha: 0.1),
        ),
      ],
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.identity});

  final VerifiedIdentity identity;

  @override
  Widget build(BuildContext context) {
    final name = identity.applicant.name;
    final rows = [
      ('First name', name.firstName),
      if (name.middleName case final middleName?) ('Middle name', middleName),
      ('Last name', name.lastName),
      ('Date of birth', formatDate(identity.applicant.dateOfBirth)),
      ('Means of verification', identity.documentType.label),
      ('Verified on', formatDate(identity.verifiedAt)),
    ];

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              identity.documentType.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: const Text(
              'Your details',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const Divider(height: 1),
          for (final (label, value) in rows)
            ListTile(
              dense: true,
              title: Text(label),
              trailing: Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// What could not be fully confirmed when the identity was verified.
class _Warnings extends StatelessWidget {
  const _Warnings({required this.identity});

  final VerifiedIdentity identity;

  @override
  Widget build(BuildContext context) {
    final warning = StatusColors.of(context).warning;
    final similarity = (identity.faceSimilarity * 100).toStringAsFixed(0);
    final notes = [
      if (!identity.isDateOfBirthConfirmed)
        (
          'Date of birth not confirmed',
          'It was not found on your ${identity.documentType.label}.',
        ),
      if (!identity.isFaceMatchConfident)
        (
          'Weak face match',
          'Similarity $similarity%. The photo on your ID may be unclear.',
        ),
    ];

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.warning_amber_rounded, color: warning),
            title: const Text(
              'Verification notes',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const Divider(height: 1),
          for (final (title, detail) in notes)
            ListTile(
              dense: true,
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(detail),
            ),
        ],
      ),
    );
  }
}
