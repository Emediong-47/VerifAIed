part of 'document_selection_bloc.dart';

@freezed
abstract class DocumentSelectionState with _$DocumentSelectionState {
  const factory DocumentSelectionState({
    @Default(DocumentType.nin) DocumentType selected,
    @Default(FormStatus.initial) FormStatus status,
  }) = _DocumentSelectionState;
}
