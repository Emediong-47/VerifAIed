part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Loads any identity saved on a previous launch.
  const factory AuthEvent.started() = AuthStarted;

  /// Signs the user in with the identity they just verified.
  const factory AuthEvent.verificationCompleted({
    required Applicant applicant,
    required DocumentType documentType,
    required DocumentImage selfie,
    required double faceSimilarity,
    @Default(true) bool isDateOfBirthConfirmed,
    @Default(true) bool isFaceMatchConfident,
  }) = VerificationCompleted;

  const factory AuthEvent.logoutRequested() = LogoutRequested;
}
