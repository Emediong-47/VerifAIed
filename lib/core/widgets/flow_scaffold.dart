import 'package:flutter/material.dart';

/// Page layout for a step of the verification flow: progress, a heading,
/// scrollable content and actions pinned to the bottom.
class FlowScaffold extends StatelessWidget {
  const FlowScaffold({
    super.key,
    required this.title,
    required this.child,
    this.step,
    this.heading,
    this.subtitle,
    this.actions = const [],
    this.appBarActions = const [],
  });

  static const totalSteps = 5;

  final String title;

  /// 1-based position in the flow; null hides the progress bar.
  final int? step;
  final String? heading;
  final String? subtitle;
  final Widget child;
  final List<Widget> actions;

  /// Small icon buttons for the top bar, such as a mute toggle.
  final List<Widget> appBarActions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final step = this.step;

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: appBarActions),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (step != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: step / totalSteps,
                        minHeight: 6,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Step $step of $totalSteps',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (heading case final heading?)
                      Text(
                        heading,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    if (subtitle case final subtitle?) ...[
                      const SizedBox(height: 8),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    if (heading != null || subtitle != null)
                      const SizedBox(height: 24),
                    child,
                  ],
                ),
              ),
            ),
            if (actions.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final (index, action) in actions.indexed) ...[
                      if (index > 0) const SizedBox(height: 12),
                      action,
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
