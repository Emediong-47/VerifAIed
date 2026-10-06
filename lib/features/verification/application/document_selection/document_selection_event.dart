part of 'document_selection_bloc.dart';

@freezed
sealed class DocumentSelectionEvent with _$DocumentSelectionEvent {
  const factory DocumentSelectionEvent.documentTypeChanged(
    DocumentType documentType,
  ) = DocumentTypeChanged;
  const factory DocumentSelectionEvent.submitted() = DocumentSelectionSubmitted;
}
