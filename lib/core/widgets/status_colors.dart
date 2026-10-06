import 'package:flutter/material.dart';

/// Semantic colours the Material colour scheme does not provide.
@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  const StatusColors({required this.success, required this.warning});

  final Color success;
  final Color warning;

  static StatusColors of(BuildContext context) =>
      Theme.of(context).extension<StatusColors>() ??
      const StatusColors(success: Colors.green, warning: Colors.orange);

  @override
  StatusColors copyWith({Color? success, Color? warning}) => StatusColors(
    success: success ?? this.success,
    warning: warning ?? this.warning,
  );

  @override
  StatusColors lerp(StatusColors? other, double t) => other == null
      ? this
      : StatusColors(
          success: Color.lerp(success, other.success, t)!,
          warning: Color.lerp(warning, other.warning, t)!,
        );
}
