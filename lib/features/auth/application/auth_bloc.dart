import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/clock.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';
import 'package:verif_aled/features/auth/domain/repositories/identity_repository.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

/// Tracks whether a verified user is signed in on this device.
@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repository, this._clock) : super(const AuthState()) {
    on<AuthStarted>(_onStarted);
    on<VerificationCompleted>(_onVerificationCompleted);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final IdentityRepository _repository;
  final Clock _clock;

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    final result = await _repository.current();
    emit(switch (result) {
      Ok(value: final identity?) => AuthState(
        status: AuthStatus.authenticated,
        identity: identity,
      ),
      Ok() => const AuthState(status: AuthStatus.unauthenticated),
      Err(:final failure) => AuthState(
        status: AuthStatus.unauthenticated,
        failure: failure,
      ),
    });
  }

  Future<void> _onVerificationCompleted(
    VerificationCompleted event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _repository.save(
      VerifiedIdentity(
        applicant: event.applicant,
        documentType: event.documentType,
        selfie: event.selfie,
        faceSimilarity: event.faceSimilarity,
        verifiedAt: _clock.now(),
        isDateOfBirthConfirmed: event.isDateOfBirthConfirmed,
        isFaceMatchConfident: event.isFaceMatchConfident,
      ),
    );
    emit(switch (result) {
      Ok(:final value) => AuthState(
        status: AuthStatus.authenticated,
        identity: value,
      ),
      Err(:final failure) => state.copyWith(failure: failure),
    });
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _repository.clear();
    emit(switch (result) {
      Ok() => const AuthState(status: AuthStatus.unauthenticated),
      Err(:final failure) => state.copyWith(failure: failure),
    });
  }
}
