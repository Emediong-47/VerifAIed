part of 'personal_details_bloc.dart';

@freezed
sealed class PersonalDetailsEvent with _$PersonalDetailsEvent {
  const factory PersonalDetailsEvent.firstNameChanged(String value) =
      FirstNameChanged;
  const factory PersonalDetailsEvent.middleNameChanged(String value) =
      MiddleNameChanged;
  const factory PersonalDetailsEvent.lastNameChanged(String value) =
      LastNameChanged;
  const factory PersonalDetailsEvent.dateOfBirthChanged(DateTime value) =
      DateOfBirthChanged;
  const factory PersonalDetailsEvent.submitted() = PersonalDetailsSubmitted;
}
