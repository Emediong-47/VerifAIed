// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_summary_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationSummary {

 CheckStatus get document; CheckStatus get liveness; CheckStatus get face;
/// Create a copy of VerificationSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationSummaryCopyWith<VerificationSummary> get copyWith => _$VerificationSummaryCopyWithImpl<VerificationSummary>(this as VerificationSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationSummary&&(identical(other.document, document) || other.document == document)&&(identical(other.liveness, liveness) || other.liveness == liveness)&&(identical(other.face, face) || other.face == face));
}


@override
int get hashCode => Object.hash(runtimeType,document,liveness,face);

@override
String toString() {
  return 'VerificationSummary(document: $document, liveness: $liveness, face: $face)';
}


}

/// @nodoc
abstract mixin class $VerificationSummaryCopyWith<$Res>  {
  factory $VerificationSummaryCopyWith(VerificationSummary value, $Res Function(VerificationSummary) _then) = _$VerificationSummaryCopyWithImpl;
@useResult
$Res call({
 CheckStatus document, CheckStatus liveness, CheckStatus face
});




}
/// @nodoc
class _$VerificationSummaryCopyWithImpl<$Res>
    implements $VerificationSummaryCopyWith<$Res> {
  _$VerificationSummaryCopyWithImpl(this._self, this._then);

  final VerificationSummary _self;
  final $Res Function(VerificationSummary) _then;

/// Create a copy of VerificationSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? document = null,Object? liveness = null,Object? face = null,}) {
  return _then(_self.copyWith(
document: null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as CheckStatus,liveness: null == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as CheckStatus,face: null == face ? _self.face : face // ignore: cast_nullable_to_non_nullable
as CheckStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationSummary].
extension VerificationSummaryPatterns on VerificationSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationSummary value)  $default,){
final _that = this;
switch (_that) {
case _VerificationSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationSummary value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckStatus document,  CheckStatus liveness,  CheckStatus face)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationSummary() when $default != null:
return $default(_that.document,_that.liveness,_that.face);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckStatus document,  CheckStatus liveness,  CheckStatus face)  $default,) {final _that = this;
switch (_that) {
case _VerificationSummary():
return $default(_that.document,_that.liveness,_that.face);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckStatus document,  CheckStatus liveness,  CheckStatus face)?  $default,) {final _that = this;
switch (_that) {
case _VerificationSummary() when $default != null:
return $default(_that.document,_that.liveness,_that.face);case _:
  return null;

}
}

}

/// @nodoc


class _VerificationSummary extends VerificationSummary {
  const _VerificationSummary({required this.document, required this.liveness, required this.face}): super._();
  

@override final  CheckStatus document;
@override final  CheckStatus liveness;
@override final  CheckStatus face;

/// Create a copy of VerificationSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationSummaryCopyWith<_VerificationSummary> get copyWith => __$VerificationSummaryCopyWithImpl<_VerificationSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationSummary&&(identical(other.document, document) || other.document == document)&&(identical(other.liveness, liveness) || other.liveness == liveness)&&(identical(other.face, face) || other.face == face));
}


@override
int get hashCode => Object.hash(runtimeType,document,liveness,face);

@override
String toString() {
  return 'VerificationSummary(document: $document, liveness: $liveness, face: $face)';
}


}

/// @nodoc
abstract mixin class _$VerificationSummaryCopyWith<$Res> implements $VerificationSummaryCopyWith<$Res> {
  factory _$VerificationSummaryCopyWith(_VerificationSummary value, $Res Function(_VerificationSummary) _then) = __$VerificationSummaryCopyWithImpl;
@override @useResult
$Res call({
 CheckStatus document, CheckStatus liveness, CheckStatus face
});




}
/// @nodoc
class __$VerificationSummaryCopyWithImpl<$Res>
    implements _$VerificationSummaryCopyWith<$Res> {
  __$VerificationSummaryCopyWithImpl(this._self, this._then);

  final _VerificationSummary _self;
  final $Res Function(_VerificationSummary) _then;

/// Create a copy of VerificationSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? document = null,Object? liveness = null,Object? face = null,}) {
  return _then(_VerificationSummary(
document: null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as CheckStatus,liveness: null == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as CheckStatus,face: null == face ? _self.face : face // ignore: cast_nullable_to_non_nullable
as CheckStatus,
  ));
}


}

// dart format on
