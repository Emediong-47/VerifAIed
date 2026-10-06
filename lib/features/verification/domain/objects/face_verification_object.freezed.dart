// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_verification_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceVerification {

/// Cosine similarity between the two faces, from -1 to 1.
 double get similarity; double get threshold;
/// Create a copy of FaceVerification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceVerificationCopyWith<FaceVerification> get copyWith => _$FaceVerificationCopyWithImpl<FaceVerification>(this as FaceVerification, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerification&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.threshold, threshold) || other.threshold == threshold));
}


@override
int get hashCode => Object.hash(runtimeType,similarity,threshold);

@override
String toString() {
  return 'FaceVerification(similarity: $similarity, threshold: $threshold)';
}


}

/// @nodoc
abstract mixin class $FaceVerificationCopyWith<$Res>  {
  factory $FaceVerificationCopyWith(FaceVerification value, $Res Function(FaceVerification) _then) = _$FaceVerificationCopyWithImpl;
@useResult
$Res call({
 double similarity, double threshold
});




}
/// @nodoc
class _$FaceVerificationCopyWithImpl<$Res>
    implements $FaceVerificationCopyWith<$Res> {
  _$FaceVerificationCopyWithImpl(this._self, this._then);

  final FaceVerification _self;
  final $Res Function(FaceVerification) _then;

/// Create a copy of FaceVerification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? similarity = null,Object? threshold = null,}) {
  return _then(_self.copyWith(
similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceVerification].
extension FaceVerificationPatterns on FaceVerification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceVerification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceVerification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceVerification value)  $default,){
final _that = this;
switch (_that) {
case _FaceVerification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceVerification value)?  $default,){
final _that = this;
switch (_that) {
case _FaceVerification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double similarity,  double threshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceVerification() when $default != null:
return $default(_that.similarity,_that.threshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double similarity,  double threshold)  $default,) {final _that = this;
switch (_that) {
case _FaceVerification():
return $default(_that.similarity,_that.threshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double similarity,  double threshold)?  $default,) {final _that = this;
switch (_that) {
case _FaceVerification() when $default != null:
return $default(_that.similarity,_that.threshold);case _:
  return null;

}
}

}

/// @nodoc


class _FaceVerification extends FaceVerification {
  const _FaceVerification({required this.similarity, required this.threshold}): super._();
  

/// Cosine similarity between the two faces, from -1 to 1.
@override final  double similarity;
@override final  double threshold;

/// Create a copy of FaceVerification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceVerificationCopyWith<_FaceVerification> get copyWith => __$FaceVerificationCopyWithImpl<_FaceVerification>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceVerification&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.threshold, threshold) || other.threshold == threshold));
}


@override
int get hashCode => Object.hash(runtimeType,similarity,threshold);

@override
String toString() {
  return 'FaceVerification(similarity: $similarity, threshold: $threshold)';
}


}

/// @nodoc
abstract mixin class _$FaceVerificationCopyWith<$Res> implements $FaceVerificationCopyWith<$Res> {
  factory _$FaceVerificationCopyWith(_FaceVerification value, $Res Function(_FaceVerification) _then) = __$FaceVerificationCopyWithImpl;
@override @useResult
$Res call({
 double similarity, double threshold
});




}
/// @nodoc
class __$FaceVerificationCopyWithImpl<$Res>
    implements _$FaceVerificationCopyWith<$Res> {
  __$FaceVerificationCopyWithImpl(this._self, this._then);

  final _FaceVerification _self;
  final $Res Function(_FaceVerification) _then;

/// Create a copy of FaceVerification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? similarity = null,Object? threshold = null,}) {
  return _then(_FaceVerification(
similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
