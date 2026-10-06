import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verif_aled/core/utils/clock.dart';
import 'package:verif_aled/core/utils/form_status.dart';
import 'package:verif_aled/features/verification/domain/objects/applicant_object.dart';
import 'package:verif_aled/features/verification/domain/objects/name_object.dart';

part 'personal_details_event.dart';
part 'personal_details_state.dart';
part 'personal_details_bloc.freezed.dart';

@injectable
class PersonalDetailsBloc
    extends Bloc<PersonalDetailsEvent, PersonalDetailsState> {
  PersonalDetailsBloc(this._clock) : super(const PersonalDetailsState()) {
    on<FirstNameChanged>(
      (event, emit) => emit(
        state.copyWith(
          firstName: event.value,
          firstNameError: null,
          status: FormStatus.initial,
        ),
      ),
    );
    on<MiddleNameChanged>(
      (event, emit) => emit(
        state.copyWith(middleName: event.value, status: FormStatus.initial),
      ),
    );
    on<LastNameChanged>(
      (event, emit) => emit(
        state.copyWith(
          lastName: event.value,
          lastNameError: null,
          status: FormStatus.initial,
        ),
      ),
    );
    on<DateOfBirthChanged>(
      (event, emit) => emit(
        state.copyWith(
          dateOfBirth: event.value,
          dateOfBirthError: null,
          status: FormStatus.initial,
        ),
      ),
    );
    on<PersonalDetailsSubmitted>(_onSubmitted);
  }

  static const minimumAge = 16;

  final Clock _clock;

  void _onSubmitted(
    PersonalDetailsSubmitted event,
    Emitter<PersonalDetailsState> emit,
  ) {
    // Re-submitting an unchanged valid form must still notify listeners.
    if (state.status == FormStatus.success) {
      emit(state.copyWith(status: FormStatus.initial));
    }

    final firstName = state.firstName.trim();
    final middleName = state.middleName.trim();
    final lastName = state.lastName.trim();

    final firstNameError = firstName.isEmpty ? 'First name is required' : null;
    final lastNameError = lastName.isEmpty ? 'Last name is required' : null;
    final dateOfBirthError = _validateDateOfBirth(state.dateOfBirth);

    if (firstNameError != null ||
        lastNameError != null ||
        dateOfBirthError != null) {
      emit(
        state.copyWith(
          firstNameError: firstNameError,
          lastNameError: lastNameError,
          dateOfBirthError: dateOfBirthError,
          status: FormStatus.invalid,
          applicant: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: FormStatus.success,
        applicant: Applicant(
          name: Name(
            firstName: firstName,
            middleName: middleName.isEmpty ? null : middleName,
            lastName: lastName,
          ),
          dateOfBirth: state.dateOfBirth!,
        ),
      ),
    );
  }

  String? _validateDateOfBirth(DateTime? dateOfBirth) {
    if (dateOfBirth == null) return 'Date of birth is required';

    final now = _clock.now();
    final today = DateTime(now.year, now.month, now.day);
    if (dateOfBirth.isAfter(today)) {
      return 'Date of birth cannot be in the future';
    }
    if (_ageOn(today, dateOfBirth) < minimumAge) {
      return 'You must be at least $minimumAge years old';
    }
    return null;
  }

  int _ageOn(DateTime date, DateTime dateOfBirth) {
    final hadBirthdayThisYear =
        date.month > dateOfBirth.month ||
        (date.month == dateOfBirth.month && date.day >= dateOfBirth.day);
    return date.year - dateOfBirth.year - (hadBirthdayThisYear ? 0 : 1);
  }
}
