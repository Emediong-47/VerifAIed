// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_verification_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DocumentVerification {

 bool get isDocumentTypeMatch; bool get isNameMatch; bool get isDateOfBirthMatch;/// Whether the holder's photo on the document shows a detectable face,
/// which the face match later depends on.
 bool get isFaceDetected; DateTime? get extractedDateOfBirth; String get rawText;
/// Create a copy of DocumentVerification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentVerificationCopyWith<DocumentVerification> get copyWith => _$DocumentVerificationCopyWithImpl<DocumentVerification>(this as DocumentVerification, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentVerification&&(identical(other.isDocumentTypeMatch, isDocumentTypeMatch) || other.isDocumentTypeMatch == isDocumentTypeMatch)&&(identical(other.isNameMatch, isNameMatch) || other.isNameMatch == isNameMatch)&&(identical(other.isDateOfBirthMatch, isDateOfBirthMatch) || other.isDateOfBirthMatch == isDateOfBirthMatch)&&(identical(other.isFaceDetected, isFaceDetected) || other.isFaceDetected == isFaceDetected)&&(identical(other.extractedDateOfBirth, extractedDateOfBirth) || other.extractedDateOfBirth == extractedDateOfBirth)&&(identical(other.rawText, rawText) || other.rawText == rawText));
}


@override
int get hashCode => Object.hash(runtimeType,isDocumentTypeMatch,isNameMatch,isDateOfBirthMatch,isFaceDetected,extractedDateOfBirth,rawText);

@override
String toString() {
  return 'DocumentVerification(isDocumentTypeMatch: $isDocumentTypeMatch, isNameMatch: $isNameMatch, isDateOfBirthMatch: $isDateOfBirthMatch, isFaceDetected: $isFaceDetected, extractedDateOfBirth: $extractedDateOfBirth, rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class $DocumentVerificationCopyWith<$Res>  {
  factory $DocumentVerificationCopyWith(DocumentVerification value, $Res Function(DocumentVerification) _then) = _$DocumentVerificationCopyWithImpl;
@useResult
$Res call({
 bool isDocumentTypeMatch, bool isNameMatch, bool isDateOfBirthMatch, bool isFaceDetected, DateTime? extractedDateOfBirth, String rawText
});




}
/// @nodoc
class _$DocumentVerificationCopyWithImpl<$Res>
    implements $DocumentVerificationCopyWith<$Res> {
  _$DocumentVerificationCopyWithImpl(this._self, this._then);

  final DocumentVerification _self;
  final $Res Function(DocumentVerification) _then;

/// Create a copy of DocumentVerification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDocumentTypeMatch = null,Object? isNameMatch = null,Object? isDateOfBirthMatch = null,Object? isFaceDetected = null,Object? extractedDateOfBirth = freezed,Object? rawText = null,}) {
  return _then(_self.copyWith(
isDocumentTypeMatch: null == isDocumentTypeMatch ? _self.isDocumentTypeMatch : isDocumentTypeMatch // ignore: cast_nullable_to_non_nullable
as bool,isNameMatch: null == isNameMatch ? _self.isNameMatch : isNameMatch // ignore: cast_nullable_to_non_nullable
as bool,isDateOfBirthMatch: null == isDateOfBirthMatch ? _self.isDateOfBirthMatch : isDateOfBirthMatch // ignore: cast_nullable_to_non_nullable
as bool,isFaceDetected: null == isFaceDetected ? _self.isFaceDetected : isFaceDetected // ignore: cast_nullable_to_non_nullable
as bool,extractedDateOfBirth: freezed == extractedDateOfBirth ? _self.extractedDateOfBirth : extractedDateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentVerification].
extension DocumentVerificationPatterns on DocumentVerification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentVerification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentVerification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentVerification value)  $default,){
final _that = this;
switch (_that) {
case _DocumentVerification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentVerification value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentVerification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDocumentTypeMatch,  bool isNameMatch,  bool isDateOfBirthMatch,  bool isFaceDetected,  DateTime? extractedDateOfBirth,  String rawText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentVerification() when $default != null:
return $default(_that.isDocumentTypeMatch,_that.isNameMatch,_that.isDateOfBirthMatch,_that.isFaceDetected,_that.extractedDateOfBirth,_that.rawText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDocumentTypeMatch,  bool isNameMatch,  bool isDateOfBirthMatch,  bool isFaceDetected,  DateTime? extractedDateOfBirth,  String rawText)  $default,) {final _that = this;
switch (_that) {
case _DocumentVerification():
return $default(_that.isDocumentTypeMatch,_that.isNameMatch,_that.isDateOfBirthMatch,_that.isFaceDetected,_that.extractedDateOfBirth,_that.rawText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDocumentTypeMatch,  bool isNameMatch,  bool isDateOfBirthMatch,  bool isFaceDetected,  DateTime? extractedDateOfBirth,  String rawText)?  $default,) {final _that = this;
switch (_that) {
case _DocumentVerification() when $default != null:
return $default(_that.isDocumentTypeMatch,_that.isNameMatch,_that.isDateOfBirthMatch,_that.isFaceDetected,_that.extractedDateOfBirth,_that.rawText);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentVerification extends DocumentVerification {
  const _DocumentVerification({required this.isDocumentTypeMatch, required this.isNameMatch, required this.isDateOfBirthMatch, required this.isFaceDetected, this.extractedDateOfBirth, required this.rawText}): super._();
  

@override final  bool isDocumentTypeMatch;
@override final  bool isNameMatch;
@override final  bool isDateOfBirthMatch;
/// Whether the holder's photo on the document shows a detectable face,
/// which the face match later depends on.
@override final  bool isFaceDetected;
@override final  DateTime? extractedDateOfBirth;
@override final  String rawText;

/// Create a copy of DocumentVerification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentVerificationCopyWith<_DocumentVerification> get copyWith => __$DocumentVerificationCopyWithImpl<_DocumentVerification>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentVerification&&(identical(other.isDocumentTypeMatch, isDocumentTypeMatch) || other.isDocumentTypeMatch == isDocumentTypeMatch)&&(identical(other.isNameMatch, isNameMatch) || other.isNameMatch == isNameMatch)&&(identical(other.isDateOfBirthMatch, isDateOfBirthMatch) || other.isDateOfBirthMatch == isDateOfBirthMatch)&&(identical(other.isFaceDetected, isFaceDetected) || other.isFaceDetected == isFaceDetected)&&(identical(other.extractedDateOfBirth, extractedDateOfBirth) || other.extractedDateOfBirth == extractedDateOfBirth)&&(identical(other.rawText, rawText) || other.rawText == rawText));
}


@override
int get hashCode => Object.hash(runtimeType,isDocumentTypeMatch,isNameMatch,isDateOfBirthMatch,isFaceDetected,extractedDateOfBirth,rawText);

@override
String toString() {
  return 'DocumentVerification(isDocumentTypeMatch: $isDocumentTypeMatch, isNameMatch: $isNameMatch, isDateOfBirthMatch: $isDateOfBirthMatch, isFaceDetected: $isFaceDetected, extractedDateOfBirth: $extractedDateOfBirth, rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class _$DocumentVerificationCopyWith<$Res> implements $DocumentVerificationCopyWith<$Res> {
  factory _$DocumentVerificationCopyWith(_DocumentVerification value, $Res Function(_DocumentVerification) _then) = __$DocumentVerificationCopyWithImpl;
@override @useResult
$Res call({
 bool isDocumentTypeMatch, bool isNameMatch, bool isDateOfBirthMatch, bool isFaceDetected, DateTime? extractedDateOfBirth, String rawText
});




}
/// @nodoc
class __$DocumentVerificationCopyWithImpl<$Res>
    implements _$DocumentVerificationCopyWith<$Res> {
  __$DocumentVerificationCopyWithImpl(this._self, this._then);

  final _DocumentVerification _self;
  final $Res Function(_DocumentVerification) _then;

/// Create a copy of DocumentVerification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDocumentTypeMatch = null,Object? isNameMatch = null,Object? isDateOfBirthMatch = null,Object? isFaceDetected = null,Object? extractedDateOfBirth = freezed,Object? rawText = null,}) {
  return _then(_DocumentVerification(
isDocumentTypeMatch: null == isDocumentTypeMatch ? _self.isDocumentTypeMatch : isDocumentTypeMatch // ignore: cast_nullable_to_non_nullable
as bool,isNameMatch: null == isNameMatch ? _self.isNameMatch : isNameMatch // ignore: cast_nullable_to_non_nullable
as bool,isDateOfBirthMatch: null == isDateOfBirthMatch ? _self.isDateOfBirthMatch : isDateOfBirthMatch // ignore: cast_nullable_to_non_nullable
as bool,isFaceDetected: null == isFaceDetected ? _self.isFaceDetected : isFaceDetected // ignore: cast_nullable_to_non_nullable
as bool,extractedDateOfBirth: freezed == extractedDateOfBirth ? _self.extractedDateOfBirth : extractedDateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
