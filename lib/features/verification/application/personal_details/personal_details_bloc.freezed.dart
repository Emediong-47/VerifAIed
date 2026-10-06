// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonalDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PersonalDetailsEvent()';
}


}

/// @nodoc
class $PersonalDetailsEventCopyWith<$Res>  {
$PersonalDetailsEventCopyWith(PersonalDetailsEvent _, $Res Function(PersonalDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [PersonalDetailsEvent].
extension PersonalDetailsEventPatterns on PersonalDetailsEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FirstNameChanged value)?  firstNameChanged,TResult Function( MiddleNameChanged value)?  middleNameChanged,TResult Function( LastNameChanged value)?  lastNameChanged,TResult Function( DateOfBirthChanged value)?  dateOfBirthChanged,TResult Function( PersonalDetailsSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case MiddleNameChanged() when middleNameChanged != null:
return middleNameChanged(_that);case LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case DateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that);case PersonalDetailsSubmitted() when submitted != null:
return submitted(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FirstNameChanged value)  firstNameChanged,required TResult Function( MiddleNameChanged value)  middleNameChanged,required TResult Function( LastNameChanged value)  lastNameChanged,required TResult Function( DateOfBirthChanged value)  dateOfBirthChanged,required TResult Function( PersonalDetailsSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case FirstNameChanged():
return firstNameChanged(_that);case MiddleNameChanged():
return middleNameChanged(_that);case LastNameChanged():
return lastNameChanged(_that);case DateOfBirthChanged():
return dateOfBirthChanged(_that);case PersonalDetailsSubmitted():
return submitted(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FirstNameChanged value)?  firstNameChanged,TResult? Function( MiddleNameChanged value)?  middleNameChanged,TResult? Function( LastNameChanged value)?  lastNameChanged,TResult? Function( DateOfBirthChanged value)?  dateOfBirthChanged,TResult? Function( PersonalDetailsSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that);case MiddleNameChanged() when middleNameChanged != null:
return middleNameChanged(_that);case LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that);case DateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that);case PersonalDetailsSubmitted() when submitted != null:
return submitted(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  firstNameChanged,TResult Function( String value)?  middleNameChanged,TResult Function( String value)?  lastNameChanged,TResult Function( DateTime value)?  dateOfBirthChanged,TResult Function()?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.value);case MiddleNameChanged() when middleNameChanged != null:
return middleNameChanged(_that.value);case LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.value);case DateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that.value);case PersonalDetailsSubmitted() when submitted != null:
return submitted();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  firstNameChanged,required TResult Function( String value)  middleNameChanged,required TResult Function( String value)  lastNameChanged,required TResult Function( DateTime value)  dateOfBirthChanged,required TResult Function()  submitted,}) {final _that = this;
switch (_that) {
case FirstNameChanged():
return firstNameChanged(_that.value);case MiddleNameChanged():
return middleNameChanged(_that.value);case LastNameChanged():
return lastNameChanged(_that.value);case DateOfBirthChanged():
return dateOfBirthChanged(_that.value);case PersonalDetailsSubmitted():
return submitted();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  firstNameChanged,TResult? Function( String value)?  middleNameChanged,TResult? Function( String value)?  lastNameChanged,TResult? Function( DateTime value)?  dateOfBirthChanged,TResult? Function()?  submitted,}) {final _that = this;
switch (_that) {
case FirstNameChanged() when firstNameChanged != null:
return firstNameChanged(_that.value);case MiddleNameChanged() when middleNameChanged != null:
return middleNameChanged(_that.value);case LastNameChanged() when lastNameChanged != null:
return lastNameChanged(_that.value);case DateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that.value);case PersonalDetailsSubmitted() when submitted != null:
return submitted();case _:
  return null;

}
}

}

/// @nodoc


class FirstNameChanged implements PersonalDetailsEvent {
  const FirstNameChanged(this.value);
  

 final  String value;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirstNameChangedCopyWith<FirstNameChanged> get copyWith => _$FirstNameChangedCopyWithImpl<FirstNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirstNameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PersonalDetailsEvent.firstNameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $FirstNameChangedCopyWith<$Res> implements $PersonalDetailsEventCopyWith<$Res> {
  factory $FirstNameChangedCopyWith(FirstNameChanged value, $Res Function(FirstNameChanged) _then) = _$FirstNameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$FirstNameChangedCopyWithImpl<$Res>
    implements $FirstNameChangedCopyWith<$Res> {
  _$FirstNameChangedCopyWithImpl(this._self, this._then);

  final FirstNameChanged _self;
  final $Res Function(FirstNameChanged) _then;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(FirstNameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MiddleNameChanged implements PersonalDetailsEvent {
  const MiddleNameChanged(this.value);
  

 final  String value;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MiddleNameChangedCopyWith<MiddleNameChanged> get copyWith => _$MiddleNameChangedCopyWithImpl<MiddleNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MiddleNameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PersonalDetailsEvent.middleNameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $MiddleNameChangedCopyWith<$Res> implements $PersonalDetailsEventCopyWith<$Res> {
  factory $MiddleNameChangedCopyWith(MiddleNameChanged value, $Res Function(MiddleNameChanged) _then) = _$MiddleNameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$MiddleNameChangedCopyWithImpl<$Res>
    implements $MiddleNameChangedCopyWith<$Res> {
  _$MiddleNameChangedCopyWithImpl(this._self, this._then);

  final MiddleNameChanged _self;
  final $Res Function(MiddleNameChanged) _then;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(MiddleNameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LastNameChanged implements PersonalDetailsEvent {
  const LastNameChanged(this.value);
  

 final  String value;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LastNameChangedCopyWith<LastNameChanged> get copyWith => _$LastNameChangedCopyWithImpl<LastNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastNameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PersonalDetailsEvent.lastNameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $LastNameChangedCopyWith<$Res> implements $PersonalDetailsEventCopyWith<$Res> {
  factory $LastNameChangedCopyWith(LastNameChanged value, $Res Function(LastNameChanged) _then) = _$LastNameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$LastNameChangedCopyWithImpl<$Res>
    implements $LastNameChangedCopyWith<$Res> {
  _$LastNameChangedCopyWithImpl(this._self, this._then);

  final LastNameChanged _self;
  final $Res Function(LastNameChanged) _then;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(LastNameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DateOfBirthChanged implements PersonalDetailsEvent {
  const DateOfBirthChanged(this.value);
  

 final  DateTime value;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateOfBirthChangedCopyWith<DateOfBirthChanged> get copyWith => _$DateOfBirthChangedCopyWithImpl<DateOfBirthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateOfBirthChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PersonalDetailsEvent.dateOfBirthChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $DateOfBirthChangedCopyWith<$Res> implements $PersonalDetailsEventCopyWith<$Res> {
  factory $DateOfBirthChangedCopyWith(DateOfBirthChanged value, $Res Function(DateOfBirthChanged) _then) = _$DateOfBirthChangedCopyWithImpl;
@useResult
$Res call({
 DateTime value
});




}
/// @nodoc
class _$DateOfBirthChangedCopyWithImpl<$Res>
    implements $DateOfBirthChangedCopyWith<$Res> {
  _$DateOfBirthChangedCopyWithImpl(this._self, this._then);

  final DateOfBirthChanged _self;
  final $Res Function(DateOfBirthChanged) _then;

/// Create a copy of PersonalDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(DateOfBirthChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class PersonalDetailsSubmitted implements PersonalDetailsEvent {
  const PersonalDetailsSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalDetailsSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PersonalDetailsEvent.submitted()';
}


}




/// @nodoc
mixin _$PersonalDetailsState {

 String get firstName; String get middleName; String get lastName; DateTime? get dateOfBirth; String? get firstNameError; String? get lastNameError; String? get dateOfBirthError; FormStatus get status; Applicant? get applicant;
/// Create a copy of PersonalDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalDetailsStateCopyWith<PersonalDetailsState> get copyWith => _$PersonalDetailsStateCopyWithImpl<PersonalDetailsState>(this as PersonalDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalDetailsState&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.dateOfBirthError, dateOfBirthError) || other.dateOfBirthError == dateOfBirthError)&&(identical(other.status, status) || other.status == status)&&(identical(other.applicant, applicant) || other.applicant == applicant));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,middleName,lastName,dateOfBirth,firstNameError,lastNameError,dateOfBirthError,status,applicant);

@override
String toString() {
  return 'PersonalDetailsState(firstName: $firstName, middleName: $middleName, lastName: $lastName, dateOfBirth: $dateOfBirth, firstNameError: $firstNameError, lastNameError: $lastNameError, dateOfBirthError: $dateOfBirthError, status: $status, applicant: $applicant)';
}


}

/// @nodoc
abstract mixin class $PersonalDetailsStateCopyWith<$Res>  {
  factory $PersonalDetailsStateCopyWith(PersonalDetailsState value, $Res Function(PersonalDetailsState) _then) = _$PersonalDetailsStateCopyWithImpl;
@useResult
$Res call({
 String firstName, String middleName, String lastName, DateTime? dateOfBirth, String? firstNameError, String? lastNameError, String? dateOfBirthError, FormStatus status, Applicant? applicant
});


$ApplicantCopyWith<$Res>? get applicant;

}
/// @nodoc
class _$PersonalDetailsStateCopyWithImpl<$Res>
    implements $PersonalDetailsStateCopyWith<$Res> {
  _$PersonalDetailsStateCopyWithImpl(this._self, this._then);

  final PersonalDetailsState _self;
  final $Res Function(PersonalDetailsState) _then;

/// Create a copy of PersonalDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? middleName = null,Object? lastName = null,Object? dateOfBirth = freezed,Object? firstNameError = freezed,Object? lastNameError = freezed,Object? dateOfBirthError = freezed,Object? status = null,Object? applicant = freezed,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleName: null == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirthError: freezed == dateOfBirthError ? _self.dateOfBirthError : dateOfBirthError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormStatus,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant?,
  ));
}
/// Create a copy of PersonalDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $ApplicantCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}
}


/// Adds pattern-matching-related methods to [PersonalDetailsState].
extension PersonalDetailsStatePatterns on PersonalDetailsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalDetailsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _PersonalDetailsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalDetailsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String middleName,  String lastName,  DateTime? dateOfBirth,  String? firstNameError,  String? lastNameError,  String? dateOfBirthError,  FormStatus status,  Applicant? applicant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalDetailsState() when $default != null:
return $default(_that.firstName,_that.middleName,_that.lastName,_that.dateOfBirth,_that.firstNameError,_that.lastNameError,_that.dateOfBirthError,_that.status,_that.applicant);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String middleName,  String lastName,  DateTime? dateOfBirth,  String? firstNameError,  String? lastNameError,  String? dateOfBirthError,  FormStatus status,  Applicant? applicant)  $default,) {final _that = this;
switch (_that) {
case _PersonalDetailsState():
return $default(_that.firstName,_that.middleName,_that.lastName,_that.dateOfBirth,_that.firstNameError,_that.lastNameError,_that.dateOfBirthError,_that.status,_that.applicant);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String middleName,  String lastName,  DateTime? dateOfBirth,  String? firstNameError,  String? lastNameError,  String? dateOfBirthError,  FormStatus status,  Applicant? applicant)?  $default,) {final _that = this;
switch (_that) {
case _PersonalDetailsState() when $default != null:
return $default(_that.firstName,_that.middleName,_that.lastName,_that.dateOfBirth,_that.firstNameError,_that.lastNameError,_that.dateOfBirthError,_that.status,_that.applicant);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalDetailsState implements PersonalDetailsState {
  const _PersonalDetailsState({this.firstName = '', this.middleName = '', this.lastName = '', this.dateOfBirth, this.firstNameError, this.lastNameError, this.dateOfBirthError, this.status = FormStatus.initial, this.applicant});
  

@override@JsonKey() final  String firstName;
@override@JsonKey() final  String middleName;
@override@JsonKey() final  String lastName;
@override final  DateTime? dateOfBirth;
@override final  String? firstNameError;
@override final  String? lastNameError;
@override final  String? dateOfBirthError;
@override@JsonKey() final  FormStatus status;
@override final  Applicant? applicant;

/// Create a copy of PersonalDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalDetailsStateCopyWith<_PersonalDetailsState> get copyWith => __$PersonalDetailsStateCopyWithImpl<_PersonalDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalDetailsState&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.firstNameError, firstNameError) || other.firstNameError == firstNameError)&&(identical(other.lastNameError, lastNameError) || other.lastNameError == lastNameError)&&(identical(other.dateOfBirthError, dateOfBirthError) || other.dateOfBirthError == dateOfBirthError)&&(identical(other.status, status) || other.status == status)&&(identical(other.applicant, applicant) || other.applicant == applicant));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,middleName,lastName,dateOfBirth,firstNameError,lastNameError,dateOfBirthError,status,applicant);

@override
String toString() {
  return 'PersonalDetailsState(firstName: $firstName, middleName: $middleName, lastName: $lastName, dateOfBirth: $dateOfBirth, firstNameError: $firstNameError, lastNameError: $lastNameError, dateOfBirthError: $dateOfBirthError, status: $status, applicant: $applicant)';
}


}

/// @nodoc
abstract mixin class _$PersonalDetailsStateCopyWith<$Res> implements $PersonalDetailsStateCopyWith<$Res> {
  factory _$PersonalDetailsStateCopyWith(_PersonalDetailsState value, $Res Function(_PersonalDetailsState) _then) = __$PersonalDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String middleName, String lastName, DateTime? dateOfBirth, String? firstNameError, String? lastNameError, String? dateOfBirthError, FormStatus status, Applicant? applicant
});


@override $ApplicantCopyWith<$Res>? get applicant;

}
/// @nodoc
class __$PersonalDetailsStateCopyWithImpl<$Res>
    implements _$PersonalDetailsStateCopyWith<$Res> {
  __$PersonalDetailsStateCopyWithImpl(this._self, this._then);

  final _PersonalDetailsState _self;
  final $Res Function(_PersonalDetailsState) _then;

/// Create a copy of PersonalDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? middleName = null,Object? lastName = null,Object? dateOfBirth = freezed,Object? firstNameError = freezed,Object? lastNameError = freezed,Object? dateOfBirthError = freezed,Object? status = null,Object? applicant = freezed,}) {
  return _then(_PersonalDetailsState(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleName: null == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,firstNameError: freezed == firstNameError ? _self.firstNameError : firstNameError // ignore: cast_nullable_to_non_nullable
as String?,lastNameError: freezed == lastNameError ? _self.lastNameError : lastNameError // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirthError: freezed == dateOfBirthError ? _self.dateOfBirthError : dateOfBirthError // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormStatus,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant?,
  ));
}

/// Create a copy of PersonalDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $ApplicantCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}
}

// dart format on
