import 'package:flutter/material.dart';
import 'package:verif_aled/core/widgets/status_colors.dart';

/// One check in a list of results: passed (optionally with a warning),
/// failed, or not yet done.
class StatusTile extends StatelessWidget {
  const StatusTile({
    super.key,
    required this.label,
    required this.passed,
    this.warning = false,
    this.detail,
  });

  final String label;

  /// Null when the check has not been completed.
  final bool? passed;

  /// Marks a passed check as needing the user's attention.
  final bool warning;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = StatusColors.of(context);
    final (icon, color, status) = switch (passed) {
      true when warning => (
        Icons.priority_high_rounded,
        colors.warning,
        'Passed with warning',
      ),
      true => (Icons.check_rounded, colors.success, 'Passed'),
      false => (Icons.close_rounded, scheme.error, 'Failed'),
      null => (Icons.more_horiz_rounded, scheme.outline, 'Not completed'),
    };

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: color.withValues(alpha: 0.15),
        child: Icon(icon, size: 20, color: color),
      ),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(detail == null ? status : '$status · $detail'),
    );
  }
}
