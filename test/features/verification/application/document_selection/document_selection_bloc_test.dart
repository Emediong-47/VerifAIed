import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/core/utils/form_status.dart';
import 'package:verif_aled/features/verification/application/document_selection/document_selection_bloc.dart';
import 'package:verif_aled/features/verification/domain/enums/document_type.dart';

void main() {
  late DocumentSelectionBloc bloc;

  setUp(() => bloc = DocumentSelectionBloc());

  tearDown(() => bloc.close());

  Future<void> dispatch(DocumentSelectionEvent event) async {
    bloc.add(event);
    await Future<void>.delayed(Duration.zero);
  }

  test('defaults to NIN with initial status', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state.selected, DocumentType.nin);
    expect(state.status, FormStatus.initial);
  });

  test('documentTypeChanged updates the selection', () async {
    // Arrange
    const event = DocumentSelectionEvent.documentTypeChanged(
      DocumentType.studentId,
    );

    // Act
    await dispatch(event);

    // Assert
    expect(bloc.state.selected, DocumentType.studentId);
  });

  test('submitted emits success with the current selection', () async {
    // Arrange
    await dispatch(
      const DocumentSelectionEvent.documentTypeChanged(DocumentType.votersCard),
    );

    // Act
    await dispatch(const DocumentSelectionEvent.submitted());

    // Assert
    expect(
      bloc.state,
      const DocumentSelectionState(
        selected: DocumentType.votersCard,
        status: FormStatus.success,
      ),
    );
  });

  test('re-submitting emits success again', () async {
    // Arrange
    await dispatch(const DocumentSelectionEvent.submitted());
    final statuses = <FormStatus>[];
    final subscription = bloc.stream.listen((s) => statuses.add(s.status));

    // Act
    await dispatch(const DocumentSelectionEvent.submitted());

    // Assert
    expect(statuses, [FormStatus.initial, FormStatus.success]);
    await subscription.cancel();
  });
}
