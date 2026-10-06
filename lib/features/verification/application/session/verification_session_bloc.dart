import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/domain/objects/verification_summary_object.dart';

part 'verification_session_event.dart';
part 'verification_session_state.dart';
part 'verification_session_bloc.freezed.dart';

/// Holds the data collected across the verification flow.
@lazySingleton
class VerificationSessionBloc
    extends Bloc<VerificationSessionEvent, VerificationSessionState> {
  VerificationSessionBloc() : super(const VerificationSessionState()) {
    on<ApplicantSubmitted>(
      (event, emit) => emit(state.copyWith(applicant: event.applicant)),
    );
    on<DocumentTypeSelected>(
      (event, emit) => emit(state.copyWith(documentType: event.documentType)),
    );
    // A new image invalidates any earlier verification of the old one.
    on<DocumentCaptured>(
      (event, emit) => emit(
        state.copyWith(
          documentImage: event.documentImage,
          documentVerification: null,
          faceVerification: null,
        ),
      ),
    );
    on<DocumentVerified>(
      (event, emit) =>
          emit(state.copyWith(documentVerification: event.verification)),
    );
    // A new selfie invalidates any earlier face match.
    on<LivenessPassed>(
      (event, emit) =>
          emit(state.copyWith(selfie: event.selfie, faceVerification: null)),
    );
    on<FaceVerificationCompleted>(
      (event, emit) =>
          emit(state.copyWith(faceVerification: event.verification)),
    );
    on<SessionReset>((_, emit) => emit(const VerificationSessionState()));
  }
}
