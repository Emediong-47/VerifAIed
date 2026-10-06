part of 'personal_details_bloc.dart';

@freezed
abstract class PersonalDetailsState with _$PersonalDetailsState {
  const factory PersonalDetailsState({
    @Default('') String firstName,
    @Default('') String middleName,
    @Default('') String lastName,
    DateTime? dateOfBirth,
    String? firstNameError,
    String? lastNameError,
    String? dateOfBirthError,
    @Default(FormStatus.initial) FormStatus status,
    Applicant? applicant,
  }) = _PersonalDetailsState;
}
