import 'package:flutter_test/flutter_test.dart';
import 'package:verif_aled/core/utils/form_status.dart';
import 'package:verif_aled/features/verification/application/personal_details/personal_details_bloc.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

import '../../../../helpers/fixed_clock.dart';

void main() {
  final today = DateTime(2026, 10, 6);
  final validDateOfBirth = DateTime(2000, 5, 20);

  late PersonalDetailsBloc bloc;

  setUp(() {
    bloc = PersonalDetailsBloc(FixedClock(today));
  });

  tearDown(() => bloc.close());

  void fillForm({
    String firstName = 'Emediong',
    String middleName = '',
    String lastName = 'Eshiet',
    DateTime? dateOfBirth,
    bool includeDateOfBirth = true,
  }) {
    bloc
      ..add(PersonalDetailsEvent.firstNameChanged(firstName))
      ..add(PersonalDetailsEvent.middleNameChanged(middleName))
      ..add(PersonalDetailsEvent.lastNameChanged(lastName));
    if (includeDateOfBirth) {
      bloc.add(
        PersonalDetailsEvent.dateOfBirthChanged(
          dateOfBirth ?? validDateOfBirth,
        ),
      );
    }
  }

  Future<void> submit() async {
    bloc.add(const PersonalDetailsEvent.submitted());
    await Future<void>.delayed(Duration.zero);
  }

  test('initial state is empty with initial status', () {
    // Arrange & Act
    final state = bloc.state;

    // Assert
    expect(state, const PersonalDetailsState());
    expect(state.status, FormStatus.initial);
  });

  test('valid submit emits success with trimmed applicant', () async {
    // Arrange
    fillForm(firstName: '  Emediong ', lastName: ' Eshiet  ');

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.success);
    expect(
      bloc.state.applicant,
      Applicant(
        name: const Name(firstName: 'Emediong', lastName: 'Eshiet'),
        dateOfBirth: validDateOfBirth,
      ),
    );
  });

  test('omitted middle name is stored as null', () async {
    // Arrange
    fillForm(middleName: '   ');

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.success);
    expect(bloc.state.applicant?.name.middleName, isNull);
  });

  test('provided middle name is trimmed and kept', () async {
    // Arrange
    fillForm(middleName: ' Uyobong ');

    // Act
    await submit();

    // Assert
    expect(bloc.state.applicant?.name.middleName, 'Uyobong');
  });

  test('empty first name emits invalid with first name error', () async {
    // Arrange
    fillForm(firstName: '');

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.invalid);
    expect(bloc.state.firstNameError, 'First name is required');
    expect(bloc.state.applicant, isNull);
  });

  test('empty last name emits invalid with last name error', () async {
    // Arrange
    fillForm(lastName: '');

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.invalid);
    expect(bloc.state.lastNameError, 'Last name is required');
  });

  test('whitespace-only names are treated as empty', () async {
    // Arrange
    fillForm(firstName: '   ', lastName: '\t');

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.invalid);
    expect(bloc.state.firstNameError, isNotNull);
    expect(bloc.state.lastNameError, isNotNull);
  });

  test('missing date of birth emits invalid with date error', () async {
    // Arrange
    fillForm(includeDateOfBirth: false);

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.invalid);
    expect(bloc.state.dateOfBirthError, 'Date of birth is required');
  });

  test('future date of birth emits invalid', () async {
    // Arrange
    fillForm(dateOfBirth: today.add(const Duration(days: 1)));

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.invalid);
    expect(
      bloc.state.dateOfBirthError,
      'Date of birth cannot be in the future',
    );
  });

  test('applicant turning 16 tomorrow is rejected', () async {
    // Arrange
    fillForm(dateOfBirth: DateTime(2010, 10, 7));

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.invalid);
    expect(bloc.state.dateOfBirthError, 'You must be at least 16 years old');
  });

  test('applicant turning 16 today is accepted', () async {
    // Arrange
    fillForm(dateOfBirth: DateTime(2010, 10, 6));

    // Act
    await submit();

    // Assert
    expect(bloc.state.status, FormStatus.success);
    expect(bloc.state.dateOfBirthError, isNull);
  });

  test('changing a field clears its error', () async {
    // Arrange
    fillForm(firstName: '');
    await submit();

    // Act
    bloc.add(const PersonalDetailsEvent.firstNameChanged('Emediong'));
    await Future<void>.delayed(Duration.zero);

    // Assert
    expect(bloc.state.firstNameError, isNull);
    expect(bloc.state.status, FormStatus.initial);
  });

  test('re-submitting a valid form emits success again', () async {
    // Arrange
    fillForm();
    await submit();
    final statuses = <FormStatus>[];
    final subscription = bloc.stream.listen((s) => statuses.add(s.status));

    // Act
    await submit();

    // Assert
    expect(statuses, [FormStatus.initial, FormStatus.success]);
    await subscription.cancel();
  });
}
