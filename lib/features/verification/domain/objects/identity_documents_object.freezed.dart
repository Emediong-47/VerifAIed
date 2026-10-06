// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_documents_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IdentityDocuments {

 DocumentType get type; DocumentImage get front; DocumentImage? get back;
/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityDocumentsCopyWith<IdentityDocuments> get copyWith => _$IdentityDocumentsCopyWithImpl<IdentityDocuments>(this as IdentityDocuments, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityDocuments&&(identical(other.type, type) || other.type == type)&&(identical(other.front, front) || other.front == front)&&(identical(other.back, back) || other.back == back));
}


@override
int get hashCode => Object.hash(runtimeType,type,front,back);

@override
String toString() {
  return 'IdentityDocuments(type: $type, front: $front, back: $back)';
}


}

/// @nodoc
abstract mixin class $IdentityDocumentsCopyWith<$Res>  {
  factory $IdentityDocumentsCopyWith(IdentityDocuments value, $Res Function(IdentityDocuments) _then) = _$IdentityDocumentsCopyWithImpl;
@useResult
$Res call({
 DocumentType type, DocumentImage front, DocumentImage? back
});


$DocumentImageCopyWith<$Res> get front;$DocumentImageCopyWith<$Res>? get back;

}
/// @nodoc
class _$IdentityDocumentsCopyWithImpl<$Res>
    implements $IdentityDocumentsCopyWith<$Res> {
  _$IdentityDocumentsCopyWithImpl(this._self, this._then);

  final IdentityDocuments _self;
  final $Res Function(IdentityDocuments) _then;

/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? front = null,Object? back = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DocumentType,front: null == front ? _self.front : front // ignore: cast_nullable_to_non_nullable
as DocumentImage,back: freezed == back ? _self.back : back // ignore: cast_nullable_to_non_nullable
as DocumentImage?,
  ));
}
/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get front {
  
  return $DocumentImageCopyWith<$Res>(_self.front, (value) {
    return _then(_self.copyWith(front: value));
  });
}/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res>? get back {
    if (_self.back == null) {
    return null;
  }

  return $DocumentImageCopyWith<$Res>(_self.back!, (value) {
    return _then(_self.copyWith(back: value));
  });
}
}


/// Adds pattern-matching-related methods to [IdentityDocuments].
extension IdentityDocumentsPatterns on IdentityDocuments {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdentityDocuments value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdentityDocuments() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdentityDocuments value)  $default,){
final _that = this;
switch (_that) {
case _IdentityDocuments():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdentityDocuments value)?  $default,){
final _that = this;
switch (_that) {
case _IdentityDocuments() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DocumentType type,  DocumentImage front,  DocumentImage? back)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdentityDocuments() when $default != null:
return $default(_that.type,_that.front,_that.back);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DocumentType type,  DocumentImage front,  DocumentImage? back)  $default,) {final _that = this;
switch (_that) {
case _IdentityDocuments():
return $default(_that.type,_that.front,_that.back);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DocumentType type,  DocumentImage front,  DocumentImage? back)?  $default,) {final _that = this;
switch (_that) {
case _IdentityDocuments() when $default != null:
return $default(_that.type,_that.front,_that.back);case _:
  return null;

}
}

}

/// @nodoc


class _IdentityDocuments implements IdentityDocuments {
  const _IdentityDocuments({required this.type, required this.front, this.back});
  

@override final  DocumentType type;
@override final  DocumentImage front;
@override final  DocumentImage? back;

/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentityDocumentsCopyWith<_IdentityDocuments> get copyWith => __$IdentityDocumentsCopyWithImpl<_IdentityDocuments>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdentityDocuments&&(identical(other.type, type) || other.type == type)&&(identical(other.front, front) || other.front == front)&&(identical(other.back, back) || other.back == back));
}


@override
int get hashCode => Object.hash(runtimeType,type,front,back);

@override
String toString() {
  return 'IdentityDocuments(type: $type, front: $front, back: $back)';
}


}

/// @nodoc
abstract mixin class _$IdentityDocumentsCopyWith<$Res> implements $IdentityDocumentsCopyWith<$Res> {
  factory _$IdentityDocumentsCopyWith(_IdentityDocuments value, $Res Function(_IdentityDocuments) _then) = __$IdentityDocumentsCopyWithImpl;
@override @useResult
$Res call({
 DocumentType type, DocumentImage front, DocumentImage? back
});


@override $DocumentImageCopyWith<$Res> get front;@override $DocumentImageCopyWith<$Res>? get back;

}
/// @nodoc
class __$IdentityDocumentsCopyWithImpl<$Res>
    implements _$IdentityDocumentsCopyWith<$Res> {
  __$IdentityDocumentsCopyWithImpl(this._self, this._then);

  final _IdentityDocuments _self;
  final $Res Function(_IdentityDocuments) _then;

/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? front = null,Object? back = freezed,}) {
  return _then(_IdentityDocuments(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DocumentType,front: null == front ? _self.front : front // ignore: cast_nullable_to_non_nullable
as DocumentImage,back: freezed == back ? _self.back : back // ignore: cast_nullable_to_non_nullable
as DocumentImage?,
  ));
}

/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get front {
  
  return $DocumentImageCopyWith<$Res>(_self.front, (value) {
    return _then(_self.copyWith(front: value));
  });
}/// Create a copy of IdentityDocuments
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res>? get back {
    if (_self.back == null) {
    return null;
  }

  return $DocumentImageCopyWith<$Res>(_self.back!, (value) {
    return _then(_self.copyWith(back: value));
  });
}
}

// dart format on
