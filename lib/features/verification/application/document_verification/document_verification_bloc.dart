import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/document_verification_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_presence_repository.dart';
import 'package:verif_aled/features/verification/domain/repositories/text_recognition_repository.dart';
import 'package:verif_aled/features/verification/domain/services/document_verifier.dart';

part 'document_verification_event.dart';
part 'document_verification_state.dart';
part 'document_verification_bloc.freezed.dart';

@injectable
class DocumentVerificationBloc
    extends Bloc<DocumentVerificationEvent, DocumentVerificationState> {
  DocumentVerificationBloc(this._repository, this._facePresence, this._verifier)
    : super(const DocumentVerificationState.initial()) {
    on<DocumentVerificationStarted>(_onStarted);
  }

  final TextRecognitionRepository _repository;
  final FacePresenceRepository _facePresence;
  final DocumentVerifier _verifier;

  Future<void> _onStarted(
    DocumentVerificationStarted event,
    Emitter<DocumentVerificationState> emit,
  ) async {
    emit(const DocumentVerificationState.verifying());
    // Both read the same photo independently, so run them together.
    final (text, face) = await (
      _repository.recognizeText(event.documentImage),
      _facePresence.containsFace(event.documentImage),
    ).wait;

    emit(switch ((text, face)) {
      (Err(:final failure), _) ||
      (_, Err(:final failure)) => DocumentVerificationState.failure(failure),
      (Ok(value: final rawText), Ok(value: final isFaceDetected)) =>
        DocumentVerificationState.verified(
          _verifier.verify(
            rawText: rawText,
            applicant: event.applicant,
            documentType: event.documentType,
            isFaceDetected: isFaceDetected,
          ),
        ),
    });
  }
}
