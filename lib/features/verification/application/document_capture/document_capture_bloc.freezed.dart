// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_capture_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DocumentCaptureEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentCaptureEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentCaptureEvent()';
}


}

/// @nodoc
class $DocumentCaptureEventCopyWith<$Res>  {
$DocumentCaptureEventCopyWith(DocumentCaptureEvent _, $Res Function(DocumentCaptureEvent) __);
}


/// Adds pattern-matching-related methods to [DocumentCaptureEvent].
extension DocumentCaptureEventPatterns on DocumentCaptureEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CaptureRequested value)?  captureRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CaptureRequested() when captureRequested != null:
return captureRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CaptureRequested value)  captureRequested,}){
final _that = this;
switch (_that) {
case CaptureRequested():
return captureRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CaptureRequested value)?  captureRequested,}){
final _that = this;
switch (_that) {
case CaptureRequested() when captureRequested != null:
return captureRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  captureRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CaptureRequested() when captureRequested != null:
return captureRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  captureRequested,}) {final _that = this;
switch (_that) {
case CaptureRequested():
return captureRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  captureRequested,}) {final _that = this;
switch (_that) {
case CaptureRequested() when captureRequested != null:
return captureRequested();case _:
  return null;

}
}

}

/// @nodoc


class CaptureRequested implements DocumentCaptureEvent {
  const CaptureRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaptureRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentCaptureEvent.captureRequested()';
}


}




/// @nodoc
mixin _$DocumentCaptureState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentCaptureState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentCaptureState()';
}


}

/// @nodoc
class $DocumentCaptureStateCopyWith<$Res>  {
$DocumentCaptureStateCopyWith(DocumentCaptureState _, $Res Function(DocumentCaptureState) __);
}


/// Adds pattern-matching-related methods to [DocumentCaptureState].
extension DocumentCaptureStatePatterns on DocumentCaptureState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CaptureInitial value)?  initial,TResult Function( Capturing value)?  capturing,TResult Function( Captured value)?  captured,TResult Function( CaptureFailed value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CaptureInitial() when initial != null:
return initial(_that);case Capturing() when capturing != null:
return capturing(_that);case Captured() when captured != null:
return captured(_that);case CaptureFailed() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CaptureInitial value)  initial,required TResult Function( Capturing value)  capturing,required TResult Function( Captured value)  captured,required TResult Function( CaptureFailed value)  failure,}){
final _that = this;
switch (_that) {
case CaptureInitial():
return initial(_that);case Capturing():
return capturing(_that);case Captured():
return captured(_that);case CaptureFailed():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CaptureInitial value)?  initial,TResult? Function( Capturing value)?  capturing,TResult? Function( Captured value)?  captured,TResult? Function( CaptureFailed value)?  failure,}){
final _that = this;
switch (_that) {
case CaptureInitial() when initial != null:
return initial(_that);case Capturing() when capturing != null:
return capturing(_that);case Captured() when captured != null:
return captured(_that);case CaptureFailed() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  capturing,TResult Function( DocumentImage documentImage)?  captured,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CaptureInitial() when initial != null:
return initial();case Capturing() when capturing != null:
return capturing();case Captured() when captured != null:
return captured(_that.documentImage);case CaptureFailed() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  capturing,required TResult Function( DocumentImage documentImage)  captured,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case CaptureInitial():
return initial();case Capturing():
return capturing();case Captured():
return captured(_that.documentImage);case CaptureFailed():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  capturing,TResult? Function( DocumentImage documentImage)?  captured,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case CaptureInitial() when initial != null:
return initial();case Capturing() when capturing != null:
return capturing();case Captured() when captured != null:
return captured(_that.documentImage);case CaptureFailed() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class CaptureInitial implements DocumentCaptureState {
  const CaptureInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaptureInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentCaptureState.initial()';
}


}




/// @nodoc


class Capturing implements DocumentCaptureState {
  const Capturing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Capturing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentCaptureState.capturing()';
}


}




/// @nodoc


class Captured implements DocumentCaptureState {
  const Captured(this.documentImage);
  

 final  DocumentImage documentImage;

/// Create a copy of DocumentCaptureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CapturedCopyWith<Captured> get copyWith => _$CapturedCopyWithImpl<Captured>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Captured&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage));
}


@override
int get hashCode => Object.hash(runtimeType,documentImage);

@override
String toString() {
  return 'DocumentCaptureState.captured(documentImage: $documentImage)';
}


}

/// @nodoc
abstract mixin class $CapturedCopyWith<$Res> implements $DocumentCaptureStateCopyWith<$Res> {
  factory $CapturedCopyWith(Captured value, $Res Function(Captured) _then) = _$CapturedCopyWithImpl;
@useResult
$Res call({
 DocumentImage documentImage
});


$DocumentImageCopyWith<$Res> get documentImage;

}
/// @nodoc
class _$CapturedCopyWithImpl<$Res>
    implements $CapturedCopyWith<$Res> {
  _$CapturedCopyWithImpl(this._self, this._then);

  final Captured _self;
  final $Res Function(Captured) _then;

/// Create a copy of DocumentCaptureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentImage = null,}) {
  return _then(Captured(
null == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage,
  ));
}

/// Create a copy of DocumentCaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get documentImage {
  
  return $DocumentImageCopyWith<$Res>(_self.documentImage, (value) {
    return _then(_self.copyWith(documentImage: value));
  });
}
}

/// @nodoc


class CaptureFailed implements DocumentCaptureState {
  const CaptureFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of DocumentCaptureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaptureFailedCopyWith<CaptureFailed> get copyWith => _$CaptureFailedCopyWithImpl<CaptureFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaptureFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DocumentCaptureState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CaptureFailedCopyWith<$Res> implements $DocumentCaptureStateCopyWith<$Res> {
  factory $CaptureFailedCopyWith(CaptureFailed value, $Res Function(CaptureFailed) _then) = _$CaptureFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$CaptureFailedCopyWithImpl<$Res>
    implements $CaptureFailedCopyWith<$Res> {
  _$CaptureFailedCopyWithImpl(this._self, this._then);

  final CaptureFailed _self;
  final $Res Function(CaptureFailed) _then;

/// Create a copy of DocumentCaptureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CaptureFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
