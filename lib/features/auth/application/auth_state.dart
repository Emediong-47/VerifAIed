part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unknown) AuthStatus status,
    VerifiedIdentity? identity,

    /// The last storage error, shown to the user once.
    Failure? failure,
  }) = _AuthState;
}
