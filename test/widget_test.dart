import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/app/app_main.dart';
import 'package:verif_aled/app/di/injection.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/auth/domain/repositories/identity_repository.dart';

import 'helpers/session_fixtures.dart';

class FakeIdentityRepository implements IdentityRepository {
  FakeIdentityRepository(this.stored, {this.delay = Duration.zero});

  final VerifiedIdentity? stored;
  final Duration delay;

  @override
  Future<Result<VerifiedIdentity?>> current() async {
    await Future<void>.delayed(delay);
    return Ok(stored);
  }

  @override
  Future<Result<VerifiedIdentity>> save(VerifiedIdentity identity) async =>
      Ok(identity);

  @override
  Future<Result<void>> clear() async => const Ok(null);
}

void main() {
  Future<void> launchWith(
    VerifiedIdentity? stored, {
    Duration delay = Duration.zero,
  }) async {
    configureDependencies();
    getIt
      ..allowReassignment = true
      ..registerLazySingleton<IdentityRepository>(
        () => FakeIdentityRepository(stored, delay: delay),
      );
  }

  setUp(() {
    // The welcome animation loops forever; reduced motion lets frames settle.
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
  });

  tearDown(() {
    TestWidgetsFlutterBinding.instance.platformDispatcher
        .clearAccessibilityFeaturesTestValue();
    return getIt.reset();
  });

  testWidgets('a new user starts on the guest welcome page', (tester) async {
    // Arrange
    await launchWith(null);

    // Act
    await tester.pumpWidget(const AppMain());
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Welcome Guest'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
  });

  testWidgets('a verified user goes straight to their welcome page', (
    tester,
  ) async {
    // Arrange
    await launchWith(testIdentity);

    // Act
    await tester.pumpWidget(const AppMain());
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Hi, Emediong Eshiet 👋'), findsOneWidget);
    expect(find.text('Welcome Guest'), findsNothing);
  });

  testWidgets('a slow database still sends a verified user to welcome', (
    tester,
  ) async {
    // Arrange
    await launchWith(testIdentity, delay: const Duration(seconds: 2));

    // Act
    await tester.pumpWidget(const AppMain());
    await tester.pump(const Duration(seconds: 1));
    final guestShownWhileLoading = find.text('Welcome Guest').evaluate();
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Assert
    expect(guestShownWhileLoading, isEmpty);
    expect(find.text('Hi, Emediong Eshiet 👋'), findsOneWidget);
  });
}
