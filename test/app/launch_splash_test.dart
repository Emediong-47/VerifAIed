import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/app/launch_splash.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';

import '../helpers/mock_auth_bloc.dart';

void main() {
  testWidgets('keeps the splash until the sign-in status is known', (
    tester,
  ) async {
    // Arrange
    final states = StreamController<AuthState>.broadcast();
    final auth = MockAuthBloc();
    when(() => auth.state).thenReturn(const AuthState());
    when(() => auth.stream).thenAnswer((_) => states.stream);
    var removed = false;
    await tester.pumpWidget(const SizedBox());

    // Act
    unawaited(
      LaunchSplash.releaseWhenReady(auth, remove: () => removed = true),
    );
    await tester.pump();
    final removedWhileLoading = removed;
    states.add(const AuthState(status: AuthStatus.unauthenticated));
    await tester.pump();
    await tester.pump();

    // Assert
    expect(removedWhileLoading, isFalse);
    expect(removed, isTrue);
    await states.close();
  });

  testWidgets('removes the splash at once when the status is already known', (
    tester,
  ) async {
    // Arrange
    final auth = mockAuthBloc(
      const AuthState(status: AuthStatus.authenticated),
    );
    var removed = false;
    await tester.pumpWidget(const SizedBox());

    // Act
    await LaunchSplash.releaseWhenReady(auth, remove: () => removed = true);
    await tester.pump();

    // Assert
    expect(removed, isTrue);
  });

  testWidgets('removes the splash if the auth stream closes early', (
    tester,
  ) async {
    // Arrange
    final auth = MockAuthBloc();
    when(() => auth.state).thenReturn(const AuthState());
    when(() => auth.stream).thenAnswer((_) => const Stream.empty());
    var removed = false;
    await tester.pumpWidget(const SizedBox());

    // Act
    await LaunchSplash.releaseWhenReady(auth, remove: () => removed = true);
    await tester.pump();

    // Assert
    expect(removed, isTrue);
  });

  testWidgets('removes the splash after the wait limit if loading stalls', (
    tester,
  ) async {
    // Arrange
    final silent = StreamController<AuthState>.broadcast();
    addTearDown(silent.close);
    final auth = MockAuthBloc();
    when(() => auth.state).thenReturn(const AuthState());
    when(() => auth.stream).thenAnswer((_) => silent.stream);
    var removed = false;
    await tester.pumpWidget(const SizedBox());

    // Act
    unawaited(
      LaunchSplash.releaseWhenReady(auth, remove: () => removed = true),
    );
    await tester.pump(LaunchSplash.maxWait - const Duration(seconds: 1));
    final removedBeforeLimit = removed;
    await tester.pump(const Duration(seconds: 1));
    await tester.pump();

    // Assert
    expect(removedBeforeLimit, isFalse);
    expect(removed, isTrue);
  });
}
