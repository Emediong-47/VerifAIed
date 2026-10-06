import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/error/failure.dart';
import 'package:verif_aled/core/utils/result.dart';
import 'package:verif_aled/features/verification/domain/objects/document_image_object.dart';
import 'package:verif_aled/features/verification/domain/repositories/document_capture_repository.dart';

part 'document_capture_event.dart';
part 'document_capture_state.dart';
part 'document_capture_bloc.freezed.dart';

@injectable
class DocumentCaptureBloc
    extends Bloc<DocumentCaptureEvent, DocumentCaptureState> {
  DocumentCaptureBloc(this._repository)
    : super(const DocumentCaptureState.initial()) {
    on<CaptureRequested>(_onCaptureRequested);
  }

  final DocumentCaptureRepository _repository;

  Future<void> _onCaptureRequested(
    CaptureRequested event,
    Emitter<DocumentCaptureState> emit,
  ) async {
    emit(const DocumentCaptureState.capturing());
    final result = await _repository.captureFromCamera();
    emit(switch (result) {
      Ok(:final value) => DocumentCaptureState.captured(value),
      Err(:final failure) => DocumentCaptureState.failure(failure),
    });
  }
}
