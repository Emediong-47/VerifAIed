import 'package:flutter/material.dart';
import 'package:verif_aled/core/widgets/status_colors.dart';

abstract final class AppTheme {
  /// Deep teal: trustworthy without the bank-blue cliché.
  static const seed = Color(0xFF00796B);

  static ThemeData light() => _build(
    ColorScheme.fromSeed(seedColor: seed),
    const StatusColors(success: Color(0xFF2E9E5B), warning: Color(0xFFB26A00)),
  );

  static ThemeData dark() => _build(
    ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
    const StatusColors(success: Color(0xFF6FD49A), warning: Color(0xFFFFB74D)),
  );

  static ThemeData _build(ColorScheme scheme, StatusColors status) {
    const radius = BorderRadius.all(Radius.circular(14));
    const buttonShape = RoundedRectangleBorder(borderRadius: radius);
    const buttonSize = Size.fromHeight(52);
    // Derived from the platform typography so custom styles keep its font.
    final textTheme = ThemeData(colorScheme: scheme).textTheme;
    final buttonText = textTheme.labelLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    OutlineInputBorder border(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      extensions: [status],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: buttonText,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: buttonSize,
          shape: buttonShape,
          textStyle: buttonText,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(textStyle: buttonText),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: border(Colors.transparent),
        enabledBorder: border(Colors.transparent),
        focusedBorder: border(scheme.primary, 2),
        errorBorder: border(scheme.error),
        focusedErrorBorder: border(scheme.error, 2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: scheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearTrackColor: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
