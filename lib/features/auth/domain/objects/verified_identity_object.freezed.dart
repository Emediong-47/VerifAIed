// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verified_identity_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifiedIdentity {

 Applicant get applicant; DocumentType get documentType; DocumentImage get selfie; double get faceSimilarity; DateTime get verifiedAt;/// False when the document had no date of birth to compare.
 bool get isDateOfBirthConfirmed;/// False when the face similarity was below the match threshold.
 bool get isFaceMatchConfident;
/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifiedIdentityCopyWith<VerifiedIdentity> get copyWith => _$VerifiedIdentityCopyWithImpl<VerifiedIdentity>(this as VerifiedIdentity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifiedIdentity&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.faceSimilarity, faceSimilarity) || other.faceSimilarity == faceSimilarity)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.isDateOfBirthConfirmed, isDateOfBirthConfirmed) || other.isDateOfBirthConfirmed == isDateOfBirthConfirmed)&&(identical(other.isFaceMatchConfident, isFaceMatchConfident) || other.isFaceMatchConfident == isFaceMatchConfident));
}


@override
int get hashCode => Object.hash(runtimeType,applicant,documentType,selfie,faceSimilarity,verifiedAt,isDateOfBirthConfirmed,isFaceMatchConfident);

@override
String toString() {
  return 'VerifiedIdentity(applicant: $applicant, documentType: $documentType, selfie: $selfie, faceSimilarity: $faceSimilarity, verifiedAt: $verifiedAt, isDateOfBirthConfirmed: $isDateOfBirthConfirmed, isFaceMatchConfident: $isFaceMatchConfident)';
}


}

/// @nodoc
abstract mixin class $VerifiedIdentityCopyWith<$Res>  {
  factory $VerifiedIdentityCopyWith(VerifiedIdentity value, $Res Function(VerifiedIdentity) _then) = _$VerifiedIdentityCopyWithImpl;
@useResult
$Res call({
 Applicant applicant, DocumentType documentType, DocumentImage selfie, double faceSimilarity, DateTime verifiedAt, bool isDateOfBirthConfirmed, bool isFaceMatchConfident
});


$ApplicantCopyWith<$Res> get applicant;$DocumentImageCopyWith<$Res> get selfie;

}
/// @nodoc
class _$VerifiedIdentityCopyWithImpl<$Res>
    implements $VerifiedIdentityCopyWith<$Res> {
  _$VerifiedIdentityCopyWithImpl(this._self, this._then);

  final VerifiedIdentity _self;
  final $Res Function(VerifiedIdentity) _then;

/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicant = null,Object? documentType = null,Object? selfie = null,Object? faceSimilarity = null,Object? verifiedAt = null,Object? isDateOfBirthConfirmed = null,Object? isFaceMatchConfident = null,}) {
  return _then(_self.copyWith(
applicant: null == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage,faceSimilarity: null == faceSimilarity ? _self.faceSimilarity : faceSimilarity // ignore: cast_nullable_to_non_nullable
as double,verifiedAt: null == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDateOfBirthConfirmed: null == isDateOfBirthConfirmed ? _self.isDateOfBirthConfirmed : isDateOfBirthConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isFaceMatchConfident: null == isFaceMatchConfident ? _self.isFaceMatchConfident : isFaceMatchConfident // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res> get applicant {
  
  return $ApplicantCopyWith<$Res>(_self.applicant, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get selfie {
  
  return $DocumentImageCopyWith<$Res>(_self.selfie, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifiedIdentity].
extension VerifiedIdentityPatterns on VerifiedIdentity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifiedIdentity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifiedIdentity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifiedIdentity value)  $default,){
final _that = this;
switch (_that) {
case _VerifiedIdentity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifiedIdentity value)?  $default,){
final _that = this;
switch (_that) {
case _VerifiedIdentity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Applicant applicant,  DocumentType documentType,  DocumentImage selfie,  double faceSimilarity,  DateTime verifiedAt,  bool isDateOfBirthConfirmed,  bool isFaceMatchConfident)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifiedIdentity() when $default != null:
return $default(_that.applicant,_that.documentType,_that.selfie,_that.faceSimilarity,_that.verifiedAt,_that.isDateOfBirthConfirmed,_that.isFaceMatchConfident);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Applicant applicant,  DocumentType documentType,  DocumentImage selfie,  double faceSimilarity,  DateTime verifiedAt,  bool isDateOfBirthConfirmed,  bool isFaceMatchConfident)  $default,) {final _that = this;
switch (_that) {
case _VerifiedIdentity():
return $default(_that.applicant,_that.documentType,_that.selfie,_that.faceSimilarity,_that.verifiedAt,_that.isDateOfBirthConfirmed,_that.isFaceMatchConfident);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Applicant applicant,  DocumentType documentType,  DocumentImage selfie,  double faceSimilarity,  DateTime verifiedAt,  bool isDateOfBirthConfirmed,  bool isFaceMatchConfident)?  $default,) {final _that = this;
switch (_that) {
case _VerifiedIdentity() when $default != null:
return $default(_that.applicant,_that.documentType,_that.selfie,_that.faceSimilarity,_that.verifiedAt,_that.isDateOfBirthConfirmed,_that.isFaceMatchConfident);case _:
  return null;

}
}

}

/// @nodoc


class _VerifiedIdentity extends VerifiedIdentity {
  const _VerifiedIdentity({required this.applicant, required this.documentType, required this.selfie, required this.faceSimilarity, required this.verifiedAt, this.isDateOfBirthConfirmed = true, this.isFaceMatchConfident = true}): super._();
  

@override final  Applicant applicant;
@override final  DocumentType documentType;
@override final  DocumentImage selfie;
@override final  double faceSimilarity;
@override final  DateTime verifiedAt;
/// False when the document had no date of birth to compare.
@override@JsonKey() final  bool isDateOfBirthConfirmed;
/// False when the face similarity was below the match threshold.
@override@JsonKey() final  bool isFaceMatchConfident;

/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifiedIdentityCopyWith<_VerifiedIdentity> get copyWith => __$VerifiedIdentityCopyWithImpl<_VerifiedIdentity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifiedIdentity&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.faceSimilarity, faceSimilarity) || other.faceSimilarity == faceSimilarity)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.isDateOfBirthConfirmed, isDateOfBirthConfirmed) || other.isDateOfBirthConfirmed == isDateOfBirthConfirmed)&&(identical(other.isFaceMatchConfident, isFaceMatchConfident) || other.isFaceMatchConfident == isFaceMatchConfident));
}


@override
int get hashCode => Object.hash(runtimeType,applicant,documentType,selfie,faceSimilarity,verifiedAt,isDateOfBirthConfirmed,isFaceMatchConfident);

@override
String toString() {
  return 'VerifiedIdentity(applicant: $applicant, documentType: $documentType, selfie: $selfie, faceSimilarity: $faceSimilarity, verifiedAt: $verifiedAt, isDateOfBirthConfirmed: $isDateOfBirthConfirmed, isFaceMatchConfident: $isFaceMatchConfident)';
}


}

/// @nodoc
abstract mixin class _$VerifiedIdentityCopyWith<$Res> implements $VerifiedIdentityCopyWith<$Res> {
  factory _$VerifiedIdentityCopyWith(_VerifiedIdentity value, $Res Function(_VerifiedIdentity) _then) = __$VerifiedIdentityCopyWithImpl;
@override @useResult
$Res call({
 Applicant applicant, DocumentType documentType, DocumentImage selfie, double faceSimilarity, DateTime verifiedAt, bool isDateOfBirthConfirmed, bool isFaceMatchConfident
});


@override $ApplicantCopyWith<$Res> get applicant;@override $DocumentImageCopyWith<$Res> get selfie;

}
/// @nodoc
class __$VerifiedIdentityCopyWithImpl<$Res>
    implements _$VerifiedIdentityCopyWith<$Res> {
  __$VerifiedIdentityCopyWithImpl(this._self, this._then);

  final _VerifiedIdentity _self;
  final $Res Function(_VerifiedIdentity) _then;

/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicant = null,Object? documentType = null,Object? selfie = null,Object? faceSimilarity = null,Object? verifiedAt = null,Object? isDateOfBirthConfirmed = null,Object? isFaceMatchConfident = null,}) {
  return _then(_VerifiedIdentity(
applicant: null == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage,faceSimilarity: null == faceSimilarity ? _self.faceSimilarity : faceSimilarity // ignore: cast_nullable_to_non_nullable
as double,verifiedAt: null == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDateOfBirthConfirmed: null == isDateOfBirthConfirmed ? _self.isDateOfBirthConfirmed : isDateOfBirthConfirmed // ignore: cast_nullable_to_non_nullable
as bool,isFaceMatchConfident: null == isFaceMatchConfident ? _self.isFaceMatchConfident : isFaceMatchConfident // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res> get applicant {
  
  return $ApplicantCopyWith<$Res>(_self.applicant, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of VerifiedIdentity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get selfie {
  
  return $DocumentImageCopyWith<$Res>(_self.selfie, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}

// dart format on
