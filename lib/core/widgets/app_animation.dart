import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum AppAnimations {
  welcome('assets/animations/welcome.json', loops: true, rest: 0.6),
  scanning('assets/animations/scanning.json', loops: true, rest: 0.25),
  success('assets/animations/success.json', loops: false, rest: 1),
  failure('assets/animations/failure.json', loops: false, rest: 1);

  const AppAnimations(this.asset, {required this.loops, required this.rest});

  final String asset;
  final bool loops;

  /// The frame shown, as progress 0..1, when the user has asked the system
  /// to reduce motion.
  final double rest;
}

/// A Lottie animation that follows the theme and the reduce-motion setting.
class AppAnimation extends StatelessWidget {
  const AppAnimation(
    this.animation, {
    super.key,
    required this.semanticLabel,
    this.size = 160,
  });

  final AppAnimations animation;
  final String semanticLabel;
  final double size;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;

    return Semantics(
      label: semanticLabel,
      image: true,
      child: SizedBox.square(
        dimension: size,
        child: Lottie.asset(
          animation.asset,
          repeat: animation.loops,
          controller: reduceMotion
              ? AlwaysStoppedAnimation(animation.rest)
              : null,
          // Layers named "primary" take the theme colour, so the
          // animations match light and dark mode.
          delegates: LottieDelegates(
            values: [
              ValueDelegate.color(const ['primary', '**'], value: primary),
              ValueDelegate.strokeColor(const [
                'primary',
                '**',
              ], value: primary),
            ],
          ),
          errorBuilder: (_, _, _) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
