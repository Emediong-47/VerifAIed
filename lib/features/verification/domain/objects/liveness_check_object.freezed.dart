// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_check_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LivenessCheck {

 List<LivenessAction> get challenges; List<LivenessAction> get completedChallenges;
/// Create a copy of LivenessCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessCheckCopyWith<LivenessCheck> get copyWith => _$LivenessCheckCopyWithImpl<LivenessCheck>(this as LivenessCheck, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessCheck&&const DeepCollectionEquality().equals(other.challenges, challenges)&&const DeepCollectionEquality().equals(other.completedChallenges, completedChallenges));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(challenges),const DeepCollectionEquality().hash(completedChallenges));

@override
String toString() {
  return 'LivenessCheck(challenges: $challenges, completedChallenges: $completedChallenges)';
}


}

/// @nodoc
abstract mixin class $LivenessCheckCopyWith<$Res>  {
  factory $LivenessCheckCopyWith(LivenessCheck value, $Res Function(LivenessCheck) _then) = _$LivenessCheckCopyWithImpl;
@useResult
$Res call({
 List<LivenessAction> challenges, List<LivenessAction> completedChallenges
});




}
/// @nodoc
class _$LivenessCheckCopyWithImpl<$Res>
    implements $LivenessCheckCopyWith<$Res> {
  _$LivenessCheckCopyWithImpl(this._self, this._then);

  final LivenessCheck _self;
  final $Res Function(LivenessCheck) _then;

/// Create a copy of LivenessCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challenges = null,Object? completedChallenges = null,}) {
  return _then(_self.copyWith(
challenges: null == challenges ? _self.challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<LivenessAction>,completedChallenges: null == completedChallenges ? _self.completedChallenges : completedChallenges // ignore: cast_nullable_to_non_nullable
as List<LivenessAction>,
  ));
}

}


/// Adds pattern-matching-related methods to [LivenessCheck].
extension LivenessCheckPatterns on LivenessCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivenessCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivenessCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivenessCheck value)  $default,){
final _that = this;
switch (_that) {
case _LivenessCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivenessCheck value)?  $default,){
final _that = this;
switch (_that) {
case _LivenessCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LivenessAction> challenges,  List<LivenessAction> completedChallenges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivenessCheck() when $default != null:
return $default(_that.challenges,_that.completedChallenges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LivenessAction> challenges,  List<LivenessAction> completedChallenges)  $default,) {final _that = this;
switch (_that) {
case _LivenessCheck():
return $default(_that.challenges,_that.completedChallenges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LivenessAction> challenges,  List<LivenessAction> completedChallenges)?  $default,) {final _that = this;
switch (_that) {
case _LivenessCheck() when $default != null:
return $default(_that.challenges,_that.completedChallenges);case _:
  return null;

}
}

}

/// @nodoc


class _LivenessCheck extends LivenessCheck {
  const _LivenessCheck({required final  List<LivenessAction> challenges, final  List<LivenessAction> completedChallenges = const []}): _challenges = challenges,_completedChallenges = completedChallenges,super._();
  

 final  List<LivenessAction> _challenges;
@override List<LivenessAction> get challenges {
  if (_challenges is EqualUnmodifiableListView) return _challenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenges);
}

 final  List<LivenessAction> _completedChallenges;
@override@JsonKey() List<LivenessAction> get completedChallenges {
  if (_completedChallenges is EqualUnmodifiableListView) return _completedChallenges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedChallenges);
}


/// Create a copy of LivenessCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivenessCheckCopyWith<_LivenessCheck> get copyWith => __$LivenessCheckCopyWithImpl<_LivenessCheck>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivenessCheck&&const DeepCollectionEquality().equals(other._challenges, _challenges)&&const DeepCollectionEquality().equals(other._completedChallenges, _completedChallenges));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_challenges),const DeepCollectionEquality().hash(_completedChallenges));

@override
String toString() {
  return 'LivenessCheck(challenges: $challenges, completedChallenges: $completedChallenges)';
}


}

/// @nodoc
abstract mixin class _$LivenessCheckCopyWith<$Res> implements $LivenessCheckCopyWith<$Res> {
  factory _$LivenessCheckCopyWith(_LivenessCheck value, $Res Function(_LivenessCheck) _then) = __$LivenessCheckCopyWithImpl;
@override @useResult
$Res call({
 List<LivenessAction> challenges, List<LivenessAction> completedChallenges
});




}
/// @nodoc
class __$LivenessCheckCopyWithImpl<$Res>
    implements _$LivenessCheckCopyWith<$Res> {
  __$LivenessCheckCopyWithImpl(this._self, this._then);

  final _LivenessCheck _self;
  final $Res Function(_LivenessCheck) _then;

/// Create a copy of LivenessCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challenges = null,Object? completedChallenges = null,}) {
  return _then(_LivenessCheck(
challenges: null == challenges ? _self._challenges : challenges // ignore: cast_nullable_to_non_nullable
as List<LivenessAction>,completedChallenges: null == completedChallenges ? _self._completedChallenges : completedChallenges // ignore: cast_nullable_to_non_nullable
as List<LivenessAction>,
  ));
}


}

// dart format on
