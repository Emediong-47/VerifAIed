// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_embedding_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceEmbedding {

 List<double> get values;
/// Create a copy of FaceEmbedding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceEmbeddingCopyWith<FaceEmbedding> get copyWith => _$FaceEmbeddingCopyWithImpl<FaceEmbedding>(this as FaceEmbedding, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceEmbedding&&const DeepCollectionEquality().equals(other.values, values));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'FaceEmbedding(values: $values)';
}


}

/// @nodoc
abstract mixin class $FaceEmbeddingCopyWith<$Res>  {
  factory $FaceEmbeddingCopyWith(FaceEmbedding value, $Res Function(FaceEmbedding) _then) = _$FaceEmbeddingCopyWithImpl;
@useResult
$Res call({
 List<double> values
});




}
/// @nodoc
class _$FaceEmbeddingCopyWithImpl<$Res>
    implements $FaceEmbeddingCopyWith<$Res> {
  _$FaceEmbeddingCopyWithImpl(this._self, this._then);

  final FaceEmbedding _self;
  final $Res Function(FaceEmbedding) _then;

/// Create a copy of FaceEmbedding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? values = null,}) {
  return _then(_self.copyWith(
values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceEmbedding].
extension FaceEmbeddingPatterns on FaceEmbedding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceEmbedding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceEmbedding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceEmbedding value)  $default,){
final _that = this;
switch (_that) {
case _FaceEmbedding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceEmbedding value)?  $default,){
final _that = this;
switch (_that) {
case _FaceEmbedding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<double> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceEmbedding() when $default != null:
return $default(_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<double> values)  $default,) {final _that = this;
switch (_that) {
case _FaceEmbedding():
return $default(_that.values);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<double> values)?  $default,) {final _that = this;
switch (_that) {
case _FaceEmbedding() when $default != null:
return $default(_that.values);case _:
  return null;

}
}

}

/// @nodoc


class _FaceEmbedding implements FaceEmbedding {
  const _FaceEmbedding(final  List<double> values): _values = values;
  

 final  List<double> _values;
@override List<double> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}


/// Create a copy of FaceEmbedding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceEmbeddingCopyWith<_FaceEmbedding> get copyWith => __$FaceEmbeddingCopyWithImpl<_FaceEmbedding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceEmbedding&&const DeepCollectionEquality().equals(other._values, _values));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'FaceEmbedding(values: $values)';
}


}

/// @nodoc
abstract mixin class _$FaceEmbeddingCopyWith<$Res> implements $FaceEmbeddingCopyWith<$Res> {
  factory _$FaceEmbeddingCopyWith(_FaceEmbedding value, $Res Function(_FaceEmbedding) _then) = __$FaceEmbeddingCopyWithImpl;
@override @useResult
$Res call({
 List<double> values
});




}
/// @nodoc
class __$FaceEmbeddingCopyWithImpl<$Res>
    implements _$FaceEmbeddingCopyWith<$Res> {
  __$FaceEmbeddingCopyWithImpl(this._self, this._then);

  final _FaceEmbedding _self;
  final $Res Function(_FaceEmbedding) _then;

/// Create a copy of FaceEmbedding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? values = null,}) {
  return _then(_FaceEmbedding(
null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
