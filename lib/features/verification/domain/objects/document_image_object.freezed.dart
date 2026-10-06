// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_image_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DocumentImage {

 String get path;
/// Create a copy of DocumentImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<DocumentImage> get copyWith => _$DocumentImageCopyWithImpl<DocumentImage>(this as DocumentImage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentImage&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'DocumentImage(path: $path)';
}


}

/// @nodoc
abstract mixin class $DocumentImageCopyWith<$Res>  {
  factory $DocumentImageCopyWith(DocumentImage value, $Res Function(DocumentImage) _then) = _$DocumentImageCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$DocumentImageCopyWithImpl<$Res>
    implements $DocumentImageCopyWith<$Res> {
  _$DocumentImageCopyWithImpl(this._self, this._then);

  final DocumentImage _self;
  final $Res Function(DocumentImage) _then;

/// Create a copy of DocumentImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentImage].
extension DocumentImagePatterns on DocumentImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentImage value)  $default,){
final _that = this;
switch (_that) {
case _DocumentImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentImage value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentImage() when $default != null:
return $default(_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path)  $default,) {final _that = this;
switch (_that) {
case _DocumentImage():
return $default(_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path)?  $default,) {final _that = this;
switch (_that) {
case _DocumentImage() when $default != null:
return $default(_that.path);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentImage implements DocumentImage {
  const _DocumentImage({required this.path});
  

@override final  String path;

/// Create a copy of DocumentImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentImageCopyWith<_DocumentImage> get copyWith => __$DocumentImageCopyWithImpl<_DocumentImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentImage&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'DocumentImage(path: $path)';
}


}

/// @nodoc
abstract mixin class _$DocumentImageCopyWith<$Res> implements $DocumentImageCopyWith<$Res> {
  factory _$DocumentImageCopyWith(_DocumentImage value, $Res Function(_DocumentImage) _then) = __$DocumentImageCopyWithImpl;
@override @useResult
$Res call({
 String path
});




}
/// @nodoc
class __$DocumentImageCopyWithImpl<$Res>
    implements _$DocumentImageCopyWith<$Res> {
  __$DocumentImageCopyWithImpl(this._self, this._then);

  final _DocumentImage _self;
  final $Res Function(_DocumentImage) _then;

/// Create a copy of DocumentImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_DocumentImage(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
