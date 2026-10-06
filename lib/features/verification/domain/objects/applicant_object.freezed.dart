// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Applicant {

 Name get name; DateTime get dateOfBirth;
/// Create a copy of Applicant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicantCopyWith<Applicant> get copyWith => _$ApplicantCopyWithImpl<Applicant>(this as Applicant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Applicant&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth));
}


@override
int get hashCode => Object.hash(runtimeType,name,dateOfBirth);

@override
String toString() {
  return 'Applicant(name: $name, dateOfBirth: $dateOfBirth)';
}


}

/// @nodoc
abstract mixin class $ApplicantCopyWith<$Res>  {
  factory $ApplicantCopyWith(Applicant value, $Res Function(Applicant) _then) = _$ApplicantCopyWithImpl;
@useResult
$Res call({
 Name name, DateTime dateOfBirth
});


$NameCopyWith<$Res> get name;

}
/// @nodoc
class _$ApplicantCopyWithImpl<$Res>
    implements $ApplicantCopyWith<$Res> {
  _$ApplicantCopyWithImpl(this._self, this._then);

  final Applicant _self;
  final $Res Function(Applicant) _then;

/// Create a copy of Applicant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? dateOfBirth = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Applicant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NameCopyWith<$Res> get name {
  
  return $NameCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// Adds pattern-matching-related methods to [Applicant].
extension ApplicantPatterns on Applicant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Applicant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Applicant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Applicant value)  $default,){
final _that = this;
switch (_that) {
case _Applicant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Applicant value)?  $default,){
final _that = this;
switch (_that) {
case _Applicant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Name name,  DateTime dateOfBirth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Applicant() when $default != null:
return $default(_that.name,_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Name name,  DateTime dateOfBirth)  $default,) {final _that = this;
switch (_that) {
case _Applicant():
return $default(_that.name,_that.dateOfBirth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Name name,  DateTime dateOfBirth)?  $default,) {final _that = this;
switch (_that) {
case _Applicant() when $default != null:
return $default(_that.name,_that.dateOfBirth);case _:
  return null;

}
}

}

/// @nodoc


class _Applicant implements Applicant {
  const _Applicant({required this.name, required this.dateOfBirth});
  

@override final  Name name;
@override final  DateTime dateOfBirth;

/// Create a copy of Applicant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicantCopyWith<_Applicant> get copyWith => __$ApplicantCopyWithImpl<_Applicant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Applicant&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth));
}


@override
int get hashCode => Object.hash(runtimeType,name,dateOfBirth);

@override
String toString() {
  return 'Applicant(name: $name, dateOfBirth: $dateOfBirth)';
}


}

/// @nodoc
abstract mixin class _$ApplicantCopyWith<$Res> implements $ApplicantCopyWith<$Res> {
  factory _$ApplicantCopyWith(_Applicant value, $Res Function(_Applicant) _then) = __$ApplicantCopyWithImpl;
@override @useResult
$Res call({
 Name name, DateTime dateOfBirth
});


@override $NameCopyWith<$Res> get name;

}
/// @nodoc
class __$ApplicantCopyWithImpl<$Res>
    implements _$ApplicantCopyWith<$Res> {
  __$ApplicantCopyWithImpl(this._self, this._then);

  final _Applicant _self;
  final $Res Function(_Applicant) _then;

/// Create a copy of Applicant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? dateOfBirth = null,}) {
  return _then(_Applicant(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Applicant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NameCopyWith<$Res> get name {
  
  return $NameCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}

// dart format on
