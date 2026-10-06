import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';
import 'package:verif_aled/features/verification/presentation/screens/personalized_welcome_page.dart';

import '../../../../helpers/mock_auth_bloc.dart';
import '../../../../helpers/session_fixtures.dart';

void main() {
  final signedIn = AuthState(
    status: AuthStatus.authenticated,
    identity: testIdentity,
  );

  Future<MockAuthBloc> pumpPage(WidgetTester tester, AuthState state) async {
    final auth = mockAuthBloc(state);
    await tester.pumpWidget(
      BlocProvider<AuthBloc>.value(
        value: auth,
        child: const MaterialApp(home: PersonalizedWelcomePage()),
      ),
    );
    return auth;
  }

  testWidgets('greets the signed-in user with their stored details', (
    tester,
  ) async {
    // Arrange
    final state = signedIn;

    // Act
    await pumpPage(tester, state);

    // Assert
    expect(find.text('Hi, Emediong Eshiet 👋'), findsOneWidget);
    expect(find.text('Verified identity'), findsOneWidget);
    for (final (label, value) in [
      ('First name', 'Emediong'),
      ('Middle name', 'Uyobong'),
      ('Last name', 'Eshiet'),
      ('Date of birth', '20/5/2000'),
      ('Means of verification', 'NIN'),
      ('Verified on', '6/10/2026'),
    ]) {
      expect(
        find.widgetWithText(ListTile, label),
        findsOneWidget,
        reason: label,
      );
      expect(
        find.descendant(
          of: find.widgetWithText(ListTile, label),
          matching: find.text(value),
        ),
        findsOneWidget,
        reason: '$label shows $value',
      );
    }
  });

  testWidgets('a fully confirmed identity shows no verification notes', (
    tester,
  ) async {
    // Arrange
    final state = signedIn;

    // Act
    await pumpPage(tester, state);

    // Assert
    expect(find.text('Verification notes'), findsNothing);
  });

  testWidgets('outlines checks that passed with warnings', (tester) async {
    // Arrange
    final state = signedIn.copyWith(
      identity: testIdentity.copyWith(
        faceSimilarity: 0.31,
        isDateOfBirthConfirmed: false,
        isFaceMatchConfident: false,
      ),
    );

    // Act
    await pumpPage(tester, state);

    // Assert
    expect(find.text('Verified with warnings'), findsOneWidget);
    expect(find.text('Verified identity'), findsNothing);
    expect(find.text('Verification notes'), findsOneWidget);
    expect(find.text('Date of birth not confirmed'), findsOneWidget);
    expect(find.text('It was not found on your NIN.'), findsOneWidget);
    expect(find.text('Weak face match'), findsOneWidget);
    expect(
      find.text('Similarity 31%. The photo on your ID may be unclear.'),
      findsOneWidget,
    );
  });

  testWidgets('omits the middle name when the user has none', (tester) async {
    // Arrange
    final state = signedIn.copyWith(
      identity: testIdentity.copyWith.applicant(
        name: const Name(firstName: 'Emediong', lastName: 'Eshiet'),
      ),
    );

    // Act
    await pumpPage(tester, state);

    // Assert
    expect(find.text('Middle name'), findsNothing);
  });

  testWidgets('a signed-out user sees no identity details', (tester) async {
    // Arrange
    const state = AuthState(status: AuthStatus.unauthenticated);

    // Act
    await pumpPage(tester, state);

    // Assert
    expect(find.text('No verified identity yet.'), findsOneWidget);
    expect(find.text('First name'), findsNothing);
    expect(find.byTooltip('Log out'), findsNothing);
  });

  testWidgets('log out asks for confirmation first', (tester) async {
    // Arrange
    await pumpPage(tester, signedIn);

    // Act
    await tester.tap(find.byTooltip('Log out'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Log out?'), findsOneWidget);
    expect(find.textContaining('removed from this device'), findsOneWidget);
  });

  testWidgets('cancelling the prompt keeps the user signed in', (tester) async {
    // Arrange
    final auth = await pumpPage(tester, signedIn);
    await tester.tap(find.byTooltip('Log out'));
    await tester.pumpAndSettle();

    // Act
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Log out?'), findsNothing);
    verifyNever(() => auth.add(const AuthEvent.logoutRequested()));
  });

  testWidgets('confirming the prompt logs the user out', (tester) async {
    // Arrange
    final auth = await pumpPage(tester, signedIn);
    final logOutButton = find.widgetWithText(OutlinedButton, 'Log out');
    await tester.scrollUntilVisible(logOutButton, 200);
    await tester.tap(logOutButton);
    await tester.pumpAndSettle();

    // Act
    await tester.tap(find.widgetWithText(FilledButton, 'Log out'));
    await tester.pumpAndSettle();

    // Assert
    verify(() => auth.add(const AuthEvent.logoutRequested())).called(1);
  });
}
