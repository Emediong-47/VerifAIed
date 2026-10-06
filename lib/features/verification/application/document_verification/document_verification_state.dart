part of 'document_verification_bloc.dart';

@freezed
sealed class DocumentVerificationState with _$DocumentVerificationState {
  const factory DocumentVerificationState.initial() = VerificationInitial;
  const factory DocumentVerificationState.verifying() = Verifying;
  const factory DocumentVerificationState.verified(
    DocumentVerification verification,
  ) = Verified;
  const factory DocumentVerificationState.failure(Failure failure) =
      VerificationFailed;
}
