import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verif_aled/app/routes/app_router.dart';
import 'package:verif_aled/core/widgets/app_animation.dart';

@RoutePage()
class GuestWelcomePage extends StatelessWidget {
  const GuestWelcomePage({super.key});

  static const _features = [
    (Icons.badge_outlined, 'Scan your ID card'),
    (Icons.face_retouching_natural, 'Take a quick liveness check'),
    (Icons.lock_outline_rounded, 'Your data stays on this device'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const AppAnimation(
                        AppAnimations.welcome,
                        semanticLabel: 'Face being scanned and verified',
                        size: 220,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Welcome Guest',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Verify your identity in a few minutes with your ID '
                        'card and a quick selfie.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 32),
                      for (final (icon, label) in _features)
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Icon(
                              icon,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          title: Text(label),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () =>
                    context.router.push(const PersonalDetailsRoute()),
                child: const Text('Get started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
