import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/auth/application/auth_bloc.dart';
import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/auth/domain/repositories/identity_repository.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

import '../../../helpers/fixed_clock.dart';
import '../../../helpers/session_fixtures.dart';

class MockIdentityRepository extends Mock implements IdentityRepository {}

void main() {
  final now = DateTime(2026, 10, 6, 9, 30);
  const cameraSelfie = DocumentImage(path: '/cache/CAP1.jpg');
  final completedEvent = AuthEvent.verificationCompleted(
    applicant: testApplicant,
    documentType: DocumentType.nin,
    selfie: cameraSelfie,
    faceSimilarity: 0.82,
  );

  late MockIdentityRepository repository;
  late AuthBloc bloc;

  setUpAll(() => registerFallbackValue(testIdentity));

  setUp(() {
    repository = MockIdentityRepository();
    bloc = AuthBloc(repository, FixedClock(now));
  });

  tearDown(() => bloc.close());

  Future<void> dispatch(AuthEvent event) async {
    bloc.add(event);
    await Future<void>.delayed(Duration.zero);
  }

  test('initial status is unknown', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state, const AuthState());
    expect(state.status, AuthStatus.unknown);
  });

  test('started with a stored identity is authenticated', () async {
    // Arrange
    when(() => repository.current()).thenAnswer((_) async => Ok(testIdentity));

    // Act
    await dispatch(const AuthEvent.started());

    // Assert
    expect(
      bloc.state,
      AuthState(status: AuthStatus.authenticated, identity: testIdentity),
    );
  });

  test('started without a stored identity is unauthenticated', () async {
    // Arrange
    when(() => repository.current()).thenAnswer((_) async => const Ok(null));

    // Act
    await dispatch(const AuthEvent.started());

    // Assert
    expect(bloc.state, const AuthState(status: AuthStatus.unauthenticated));
  });

  test(
    'a storage error at start is unauthenticated with the failure',
    () async {
      // Arrange
      when(
        () => repository.current(),
      ).thenAnswer((_) async => const Err(StorageFailure('disk full')));

      // Act
      await dispatch(const AuthEvent.started());

      // Assert
      expect(bloc.state.status, AuthStatus.unauthenticated);
      expect(bloc.state.failure, const StorageFailure('disk full'));
    },
  );

  test('verificationCompleted saves the identity and signs in', () async {
    // Arrange
    final stored = testIdentity.copyWith(verifiedAt: now);
    when(() => repository.save(any())).thenAnswer((_) async => Ok(stored));

    // Act
    await dispatch(completedEvent);

    // Assert
    final saved =
        verify(() => repository.save(captureAny())).captured.single
            as VerifiedIdentity;
    expect(
      saved,
      VerifiedIdentity(
        applicant: testApplicant,
        documentType: DocumentType.nin,
        selfie: cameraSelfie,
        faceSimilarity: 0.82,
        verifiedAt: now,
      ),
    );
    expect(
      bloc.state,
      AuthState(status: AuthStatus.authenticated, identity: stored),
    );
  });

  test('a failed save keeps the user signed out with the failure', () async {
    // Arrange
    when(() => repository.current()).thenAnswer((_) async => const Ok(null));
    await dispatch(const AuthEvent.started());
    when(
      () => repository.save(any()),
    ).thenAnswer((_) async => const Err(StorageFailure('read-only')));

    // Act
    await dispatch(completedEvent);

    // Assert
    expect(bloc.state.status, AuthStatus.unauthenticated);
    expect(bloc.state.failure, const StorageFailure('read-only'));
  });

  test('logoutRequested clears the identity and signs out', () async {
    // Arrange
    when(() => repository.current()).thenAnswer((_) async => Ok(testIdentity));
    when(() => repository.clear()).thenAnswer((_) async => const Ok(null));
    await dispatch(const AuthEvent.started());

    // Act
    await dispatch(const AuthEvent.logoutRequested());

    // Assert
    expect(bloc.state, const AuthState(status: AuthStatus.unauthenticated));
    verify(() => repository.clear()).called(1);
  });

  test('a failed logout stays signed in with the failure', () async {
    // Arrange
    when(() => repository.current()).thenAnswer((_) async => Ok(testIdentity));
    when(
      () => repository.clear(),
    ).thenAnswer((_) async => const Err(StorageFailure('locked')));
    await dispatch(const AuthEvent.started());

    // Act
    await dispatch(const AuthEvent.logoutRequested());

    // Assert
    expect(bloc.state.status, AuthStatus.authenticated);
    expect(bloc.state.identity, testIdentity);
    expect(bloc.state.failure, const StorageFailure('locked'));
  });
}
