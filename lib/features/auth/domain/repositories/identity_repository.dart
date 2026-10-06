import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/auth/domain/objects/verified_identity_object.dart';

abstract interface class IdentityRepository {
  /// The stored identity, or null when nobody is signed in.
  Future<Result<VerifiedIdentity?>> current();

  /// Stores [identity], replacing any previous one, and returns it as saved.
  Future<Result<VerifiedIdentity>> save(VerifiedIdentity identity);

  /// Removes the stored identity and its selfie.
  Future<Result<void>> clear();
}
