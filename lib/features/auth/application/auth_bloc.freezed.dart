// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthStarted value)?  started,TResult Function( VerificationCompleted value)?  verificationCompleted,TResult Function( LogoutRequested value)?  logoutRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started(_that);case VerificationCompleted() when verificationCompleted != null:
return verificationCompleted(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthStarted value)  started,required TResult Function( VerificationCompleted value)  verificationCompleted,required TResult Function( LogoutRequested value)  logoutRequested,}){
final _that = this;
switch (_that) {
case AuthStarted():
return started(_that);case VerificationCompleted():
return verificationCompleted(_that);case LogoutRequested():
return logoutRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthStarted value)?  started,TResult? Function( VerificationCompleted value)?  verificationCompleted,TResult? Function( LogoutRequested value)?  logoutRequested,}){
final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started(_that);case VerificationCompleted() when verificationCompleted != null:
return verificationCompleted(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( Applicant applicant,  DocumentType documentType,  DocumentImage selfie,  double faceSimilarity,  bool isDateOfBirthConfirmed,  bool isFaceMatchConfident)?  verificationCompleted,TResult Function()?  logoutRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started();case VerificationCompleted() when verificationCompleted != null:
return verificationCompleted(_that.applicant,_that.documentType,_that.selfie,_that.faceSimilarity,_that.isDateOfBirthConfirmed,_that.isFaceMatchConfident);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( Applicant applicant,  DocumentType documentType,  DocumentImage selfie,  double faceSimilarity,  bool isDateOfBirthConfirmed,  bool isFaceMatchConfident)  verificationCompleted,required TResult Function()  logoutRequested,}) {final _that = this;
switch (_that) {
case AuthStarted():
return started();case VerificationCompleted():
return verificationCompleted(_that.applicant,_that.documentType,_that.selfie,_that.faceSimilarity,_that.isDateOfBirthConfirmed,_that.isFaceMatchConfident);case LogoutRequested():
return logoutRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( Applicant applicant,  DocumentType documentType,  DocumentImage selfie,  double faceSimilarity,  bool isDateOfBirthConfirmed,  bool isFaceMatchConfident)?  verificationCompleted,TResult? Function()?  logoutRequested,}) {final _that = this;
switch (_that) {
case AuthStarted() when started != null:
return started();case VerificationCompleted() when verificationCompleted != null:
return verificationCompleted(_that.applicant,_that.documentType,_that.selfie,_that.faceSimilarity,_that.isDateOfBirthConfirmed,_that.isFaceMatchConfident);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
  return null;

}
}

}

/// @nodoc


class AuthStarted implements AuthEvent {
  const AuthStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.started()';
}


}




/// @nodoc


class VerificationCompleted implements AuthEvent {
  const VerificationCompleted({required this.applicant, required this.documentType, required this.selfie, required this.faceSimilarity, this.isDateOfBirthConfirmed = true, this.isFaceMatchConfident = true});
  

 final  Applicant applicant;
 final  DocumentType documentType;
 final  DocumentImage selfie;
 final  double faceSimilarity;
@JsonKey() final  bool isDateOfBirthConfirmed;
@JsonKey() final  bool isFaceMatchConfident;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationCompletedCopyWith<VerificationCompleted> get copyWith => _$VerificationCompletedCopyWithImpl<VerificationCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationCompleted&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.faceSimilarity, faceSimilarity) || other.faceSimilarity == faceSimilarity)&&(identical(other.isDateOfBirthConfirmed, isDateOfBirthConfirmed) || other.isDateOfBirthConfirmed == isDateOfBirthConfirmed)&&(identical(other.isFaceMatchConfident, isFaceMatchConfident) || other.isFaceMatchConfident == isFaceMatchConfident));
}


@override
int get hashCode => Object.hash(runtimeType,applicant,documentType,selfie,faceSimilarity,isDateOfBirthConfirmed,isFaceMatchConfident);

@override
String toString() {
  return 'AuthEvent.verificationCompleted(applicant: $applicant, documentType: $documentType, selfie: $selfie, faceSimilarity: $faceSimilarity, isDateOfBirthConfirmed: $isDateOfBirthConfirmed, isFaceMatchConfident: $isFaceMatchConfident)';
}


}

/// @nodoc
abstract mixin class $VerificationCompletedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $VerificationCompletedCopyWith(VerificationCompleted value, $Res Function(VerificationCompleted) _then) = _$VerificationCompletedCopyWithImpl;
@useResult
$Res call({
 Applicant applicant, DocumentType documentType, DocumentImage selfie, double faceSimilarity, bool isDateOfBirthConfirmed, bool isFaceMatchConfident
});


$ApplicantCopyWith<$Res> get applicant;$DocumentImageCopyWith<$Res> get selfie;

}
/// @nodoc
class _$VerificationCompletedCopyWithImpl<$Res>
    implements $VerificationCompletedCopyWith<$Res> {
  _$VerificationCompletedCopyWithImpl(this._self, this._then);

  final VerificationCompleted _self;
  final $Res Function(VerificationCompleted) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicant = null,Object? documentType = null,Object? selfie = null,Object? faceSimilarity = null,Object? isDateOfBirthConfirmed = null,Object? isFaceMatchConfident = null,}) {
  return _then(VerificationCompleted(
applicant: null == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage,faceSimilarity: null == faceSimilarity ? _self.faceSimilarity : faceSimilarity // ignore: cast_nullable_to_non_nullable
as double,isDateOfBirthConfirmed: null == isDateOfBirthConfirmed ? _self.isDateOfBirthConfirmed : isDateOfBirthConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isFaceMatchConfident: null == isFaceMatchConfident ? _self.isFaceMatchConfident : isFaceMatchConfident // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res> get applicant {
  
  return $ApplicantCopyWith<$Res>(_self.applicant, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get selfie {
  
  return $DocumentImageCopyWith<$Res>(_self.selfie, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}

/// @nodoc


class LogoutRequested implements AuthEvent {
  const LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc
mixin _$AuthState {

 AuthStatus get status; VerifiedIdentity? get identity;/// The last storage error, shown to the user once.
 Failure? get failure;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,identity,failure);

@override
String toString() {
  return 'AuthState(status: $status, identity: $identity, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AuthStatus status, VerifiedIdentity? identity, Failure? failure
});


$VerifiedIdentityCopyWith<$Res>? get identity;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? identity = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,identity: freezed == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as VerifiedIdentity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifiedIdentityCopyWith<$Res>? get identity {
    if (_self.identity == null) {
    return null;
  }

  return $VerifiedIdentityCopyWith<$Res>(_self.identity!, (value) {
    return _then(_self.copyWith(identity: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthStatus status,  VerifiedIdentity? identity,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.identity,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthStatus status,  VerifiedIdentity? identity,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.status,_that.identity,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthStatus status,  VerifiedIdentity? identity,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.identity,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.status = AuthStatus.unknown, this.identity, this.failure});
  

@override@JsonKey() final  AuthStatus status;
@override final  VerifiedIdentity? identity;
/// The last storage error, shown to the user once.
@override final  Failure? failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.identity, identity) || other.identity == identity)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,identity,failure);

@override
String toString() {
  return 'AuthState(status: $status, identity: $identity, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 AuthStatus status, VerifiedIdentity? identity, Failure? failure
});


@override $VerifiedIdentityCopyWith<$Res>? get identity;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? identity = freezed,Object? failure = freezed,}) {
  return _then(_AuthState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,identity: freezed == identity ? _self.identity : identity // ignore: cast_nullable_to_non_nullable
as VerifiedIdentity?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifiedIdentityCopyWith<$Res>? get identity {
    if (_self.identity == null) {
    return null;
  }

  return $VerifiedIdentityCopyWith<$Res>(_self.identity!, (value) {
    return _then(_self.copyWith(identity: value));
  });
}
}

// dart format on
