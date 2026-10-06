import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/utils/form_status.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';

part 'document_selection_event.dart';
part 'document_selection_state.dart';
part 'document_selection_bloc.freezed.dart';

@injectable
class DocumentSelectionBloc
    extends Bloc<DocumentSelectionEvent, DocumentSelectionState> {
  DocumentSelectionBloc() : super(const DocumentSelectionState()) {
    on<DocumentTypeChanged>(
      (event, emit) => emit(
        state.copyWith(
          selected: event.documentType,
          status: FormStatus.initial,
        ),
      ),
    );
    on<DocumentSelectionSubmitted>((_, emit) {
      // Re-submitting an unchanged selection must still notify listeners.
      if (state.status == FormStatus.success) {
        emit(state.copyWith(status: FormStatus.initial));
      }
      emit(state.copyWith(status: FormStatus.success));
    });
  }
}
