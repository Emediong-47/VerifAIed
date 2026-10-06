import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:verif_aled/app/theme/app_theme.dart';
import 'package:verif_aled/core/widgets/app_animation.dart';

void main() {
  /// Every shape item in a Lottie file, however deeply grouped.
  Iterable<Map<String, dynamic>> shapeItems(Map<String, dynamic> json) sync* {
    Iterable<Map<String, dynamic>> walk(List<dynamic> items) sync* {
      for (final item in items.cast<Map<String, dynamic>>()) {
        yield item;
        if (item['it'] case final List<dynamic> children) yield* walk(children);
      }
    }

    for (final layer in (json['layers'] as List).cast<Map<String, dynamic>>()) {
      yield* walk(layer['shapes'] as List? ?? const []);
    }
  }

  for (final animation in AppAnimations.values) {
    group(animation.name, () {
      test('is a valid Lottie composition', () async {
        // Arrange
        final bytes = File(animation.asset).readAsBytesSync();

        // Act
        final composition = await LottieComposition.fromBytes(bytes);

        // Assert
        expect(composition.duration, greaterThan(Duration.zero));
        expect(
          (composition.bounds.width, composition.bounds.height),
          (200, 200),
        );
      });

      test('names every shape so theme colours can be applied', () {
        // Arrange
        final json =
            jsonDecode(File(animation.asset).readAsStringSync())
                as Map<String, dynamic>;

        // Act
        final unnamed = shapeItems(json).where((item) => item['nm'] == null);

        // Assert
        expect(unnamed, isEmpty);
      });

      test('rest frame is within the animation', () {
        // Arrange & Act
        final rest = animation.rest;

        // Assert
        expect(rest, inInclusiveRange(0, 1));
      });
    });
  }

  testWidgets('reduced motion holds the animation on its rest frame', (
    tester,
  ) async {
    // Arrange
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);

    // Act
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: const AppAnimation(
          AppAnimations.success,
          semanticLabel: 'Verification succeeded',
        ),
      ),
    );

    // Assert
    final lottie = tester.widget<LottieBuilder>(find.byType(LottieBuilder));
    expect(lottie.controller?.value, AppAnimations.success.rest);
    expect(find.bySemanticsLabel('Verification succeeded'), findsOneWidget);
  });

  testWidgets('normal motion lets the animation play', (tester) async {
    // Arrange
    const widget = AppAnimation(
      AppAnimations.scanning,
      semanticLabel: 'Reading the document',
    );

    // Act
    await tester.pumpWidget(MaterialApp(theme: AppTheme.light(), home: widget));

    // Assert
    final lottie = tester.widget<LottieBuilder>(find.byType(LottieBuilder));
    expect(lottie.controller, isNull);
    expect(lottie.repeat, isTrue);
  });
}
