import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verif_aled/features/verification/domain/enums/check_status.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';

part 'verification_summary_object.freezed.dart';

/// The outcome of each verification stage and of the flow as a whole.
@freezed
abstract class VerificationSummary with _$VerificationSummary {
  const VerificationSummary._();

  const factory VerificationSummary({
    required CheckStatus document,
    required CheckStatus liveness,
    required CheckStatus face,
  }) = _VerificationSummary;

  factory VerificationSummary.from({
    DocumentVerification? documentVerification,
    DocumentImage? selfie,
    FaceVerification? faceVerification,
  }) => VerificationSummary(
    document: switch (documentVerification) {
      null => CheckStatus.notCompleted,
      DocumentVerification(isSuccessful: false) => CheckStatus.failed,
      DocumentVerification(hasWarning: true) => CheckStatus.passedWithWarning,
      _ => CheckStatus.passed,
    },
    // A selfie is only taken once every liveness challenge has passed.
    liveness: selfie == null ? CheckStatus.notCompleted : CheckStatus.passed,
    face: switch (faceVerification) {
      null => CheckStatus.notCompleted,
      FaceVerification(isConfidentMatch: true) => CheckStatus.passed,
      _ => CheckStatus.passedWithWarning,
    },
  );

  /// The identity is verified when every stage has passed, with or without
  /// warnings.
  bool get isVerified =>
      document.isPassed && liveness.isPassed && face.isPassed;

  bool get hasWarnings =>
      [document, liveness, face].contains(CheckStatus.passedWithWarning);
}
