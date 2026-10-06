import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/objects/face_verification_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/face_embedding_repository.dart';
import 'package:verif_aled/features/verification/domain/services/face_matcher.dart';

part 'face_verification_event.dart';
part 'face_verification_state.dart';
part 'face_verification_bloc.freezed.dart';

@injectable
class FaceVerificationBloc
    extends Bloc<FaceVerificationEvent, FaceVerificationState> {
  FaceVerificationBloc(this._repository, this._matcher)
    : super(const FaceVerificationState.initial()) {
    on<FaceVerificationStarted>(_onStarted);
  }

  final FaceEmbeddingRepository _repository;
  final FaceMatcher _matcher;

  Future<void> _onStarted(
    FaceVerificationStarted event,
    Emitter<FaceVerificationState> emit,
  ) async {
    emit(const FaceVerificationState.verifying());

    // Sequential: the model interpreter is not safe to run concurrently.
    final document = await _repository.embed(event.documentImage);
    if (document case Err(:final failure)) {
      emit(FaceVerificationState.failure(failure, FacePhoto.document));
      return;
    }
    final selfie = await _repository.embed(event.selfie);
    if (selfie case Err(:final failure)) {
      emit(FaceVerificationState.failure(failure, FacePhoto.selfie));
      return;
    }

    emit(
      FaceVerificationState.verified(
        _matcher.compare((document as Ok).value, (selfie as Ok).value),
      ),
    );
  }
}
