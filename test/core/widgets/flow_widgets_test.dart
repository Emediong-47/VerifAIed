import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/app/theme/app_theme.dart';
import 'package:verif_aled/core/widgets/flow_scaffold.dart';
import 'package:verif_aled/core/widgets/status_tile.dart';

void main() {
  Widget app(Widget home) => MaterialApp(theme: AppTheme.light(), home: home);

  group('FlowScaffold', () {
    testWidgets('shows the step and how far through the flow it is', (
      tester,
    ) async {
      // Arrange
      const page = FlowScaffold(
        title: 'Liveness Check',
        step: 4,
        child: Text('body'),
      );

      // Act
      await tester.pumpWidget(app(page));

      // Assert
      expect(find.text('Step 4 of 5'), findsOneWidget);
      final progress = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(progress.value, 4 / FlowScaffold.totalSteps);
    });

    testWidgets('hides progress for pages outside the steps', (tester) async {
      // Arrange
      const page = FlowScaffold(title: 'Result', child: Text('body'));

      // Act
      await tester.pumpWidget(app(page));

      // Assert
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.textContaining('Step'), findsNothing);
    });

    testWidgets('shows heading, subtitle, content and actions', (tester) async {
      // Arrange
      final page = FlowScaffold(
        title: 'Select Document',
        heading: 'Choose your document',
        subtitle: 'Pick the ID you have with you.',
        actions: [
          FilledButton(onPressed: () {}, child: const Text('Continue')),
        ],
        child: const Text('options'),
      );

      // Act
      await tester.pumpWidget(app(page));

      // Assert
      expect(find.text('Choose your document'), findsOneWidget);
      expect(find.text('Pick the ID you have with you.'), findsOneWidget);
      expect(find.text('options'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, 'Continue'), findsOneWidget);
    });
  });

  group('StatusTile', () {
    final cases = <(bool?, String?, String, IconData)>[
      (true, null, 'Passed', Icons.check_rounded),
      (false, null, 'Failed', Icons.close_rounded),
      (null, null, 'Not completed', Icons.more_horiz_rounded),
      (true, 'Similarity 82%', 'Passed · Similarity 82%', Icons.check_rounded),
    ];

    for (final (passed, detail, text, icon) in cases) {
      testWidgets('passed=$passed detail=$detail shows "$text"', (
        tester,
      ) async {
        // Arrange
        final tile = StatusTile(
          label: 'Face match',
          passed: passed,
          detail: detail,
        );

        // Act
        await tester.pumpWidget(app(Material(child: tile)));

        // Assert
        expect(find.text('Face match'), findsOneWidget);
        expect(find.text(text), findsOneWidget);
        expect(find.byIcon(icon), findsOneWidget);
      });
    }
  });
}
