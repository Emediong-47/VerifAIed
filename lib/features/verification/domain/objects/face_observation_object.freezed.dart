// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_observation_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceObservation {

/// Degrees the head is turned; positive means towards the user's left.
 double get yaw;/// Degrees the head is tilted; positive means looking up.
 double get pitch; double? get smilingProbability;/// Stays the same while the detector keeps seeing the same face.
 int? get trackingId;/// Centre of the face as a fraction of the upright frame, 0..1.
/// Null when the frame size is unknown.
 double? get centerX; double? get centerY;/// Face width as a fraction of the upright frame width.
 double? get faceWidth;
/// Create a copy of FaceObservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceObservationCopyWith<FaceObservation> get copyWith => _$FaceObservationCopyWithImpl<FaceObservation>(this as FaceObservation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceObservation&&(identical(other.yaw, yaw) || other.yaw == yaw)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.smilingProbability, smilingProbability) || other.smilingProbability == smilingProbability)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId)&&(identical(other.centerX, centerX) || other.centerX == centerX)&&(identical(other.centerY, centerY) || other.centerY == centerY)&&(identical(other.faceWidth, faceWidth) || other.faceWidth == faceWidth));
}


@override
int get hashCode => Object.hash(runtimeType,yaw,pitch,smilingProbability,trackingId,centerX,centerY,faceWidth);

@override
String toString() {
  return 'FaceObservation(yaw: $yaw, pitch: $pitch, smilingProbability: $smilingProbability, trackingId: $trackingId, centerX: $centerX, centerY: $centerY, faceWidth: $faceWidth)';
}


}

/// @nodoc
abstract mixin class $FaceObservationCopyWith<$Res>  {
  factory $FaceObservationCopyWith(FaceObservation value, $Res Function(FaceObservation) _then) = _$FaceObservationCopyWithImpl;
@useResult
$Res call({
 double yaw, double pitch, double? smilingProbability, int? trackingId, double? centerX, double? centerY, double? faceWidth
});




}
/// @nodoc
class _$FaceObservationCopyWithImpl<$Res>
    implements $FaceObservationCopyWith<$Res> {
  _$FaceObservationCopyWithImpl(this._self, this._then);

  final FaceObservation _self;
  final $Res Function(FaceObservation) _then;

/// Create a copy of FaceObservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? yaw = null,Object? pitch = null,Object? smilingProbability = freezed,Object? trackingId = freezed,Object? centerX = freezed,Object? centerY = freezed,Object? faceWidth = freezed,}) {
  return _then(_self.copyWith(
yaw: null == yaw ? _self.yaw : yaw // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double,smilingProbability: freezed == smilingProbability ? _self.smilingProbability : smilingProbability // ignore: cast_nullable_to_non_nullable
as double?,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as int?,centerX: freezed == centerX ? _self.centerX : centerX // ignore: cast_nullable_to_non_nullable
as double?,centerY: freezed == centerY ? _self.centerY : centerY // ignore: cast_nullable_to_non_nullable
as double?,faceWidth: freezed == faceWidth ? _self.faceWidth : faceWidth // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceObservation].
extension FaceObservationPatterns on FaceObservation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceObservation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceObservation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceObservation value)  $default,){
final _that = this;
switch (_that) {
case _FaceObservation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceObservation value)?  $default,){
final _that = this;
switch (_that) {
case _FaceObservation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double yaw,  double pitch,  double? smilingProbability,  int? trackingId,  double? centerX,  double? centerY,  double? faceWidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceObservation() when $default != null:
return $default(_that.yaw,_that.pitch,_that.smilingProbability,_that.trackingId,_that.centerX,_that.centerY,_that.faceWidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double yaw,  double pitch,  double? smilingProbability,  int? trackingId,  double? centerX,  double? centerY,  double? faceWidth)  $default,) {final _that = this;
switch (_that) {
case _FaceObservation():
return $default(_that.yaw,_that.pitch,_that.smilingProbability,_that.trackingId,_that.centerX,_that.centerY,_that.faceWidth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double yaw,  double pitch,  double? smilingProbability,  int? trackingId,  double? centerX,  double? centerY,  double? faceWidth)?  $default,) {final _that = this;
switch (_that) {
case _FaceObservation() when $default != null:
return $default(_that.yaw,_that.pitch,_that.smilingProbability,_that.trackingId,_that.centerX,_that.centerY,_that.faceWidth);case _:
  return null;

}
}

}

/// @nodoc


class _FaceObservation implements FaceObservation {
  const _FaceObservation({required this.yaw, required this.pitch, this.smilingProbability, this.trackingId, this.centerX, this.centerY, this.faceWidth});
  

/// Degrees the head is turned; positive means towards the user's left.
@override final  double yaw;
/// Degrees the head is tilted; positive means looking up.
@override final  double pitch;
@override final  double? smilingProbability;
/// Stays the same while the detector keeps seeing the same face.
@override final  int? trackingId;
/// Centre of the face as a fraction of the upright frame, 0..1.
/// Null when the frame size is unknown.
@override final  double? centerX;
@override final  double? centerY;
/// Face width as a fraction of the upright frame width.
@override final  double? faceWidth;

/// Create a copy of FaceObservation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceObservationCopyWith<_FaceObservation> get copyWith => __$FaceObservationCopyWithImpl<_FaceObservation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceObservation&&(identical(other.yaw, yaw) || other.yaw == yaw)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.smilingProbability, smilingProbability) || other.smilingProbability == smilingProbability)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId)&&(identical(other.centerX, centerX) || other.centerX == centerX)&&(identical(other.centerY, centerY) || other.centerY == centerY)&&(identical(other.faceWidth, faceWidth) || other.faceWidth == faceWidth));
}


@override
int get hashCode => Object.hash(runtimeType,yaw,pitch,smilingProbability,trackingId,centerX,centerY,faceWidth);

@override
String toString() {
  return 'FaceObservation(yaw: $yaw, pitch: $pitch, smilingProbability: $smilingProbability, trackingId: $trackingId, centerX: $centerX, centerY: $centerY, faceWidth: $faceWidth)';
}


}

/// @nodoc
abstract mixin class _$FaceObservationCopyWith<$Res> implements $FaceObservationCopyWith<$Res> {
  factory _$FaceObservationCopyWith(_FaceObservation value, $Res Function(_FaceObservation) _then) = __$FaceObservationCopyWithImpl;
@override @useResult
$Res call({
 double yaw, double pitch, double? smilingProbability, int? trackingId, double? centerX, double? centerY, double? faceWidth
});




}
/// @nodoc
class __$FaceObservationCopyWithImpl<$Res>
    implements _$FaceObservationCopyWith<$Res> {
  __$FaceObservationCopyWithImpl(this._self, this._then);

  final _FaceObservation _self;
  final $Res Function(_FaceObservation) _then;

/// Create a copy of FaceObservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? yaw = null,Object? pitch = null,Object? smilingProbability = freezed,Object? trackingId = freezed,Object? centerX = freezed,Object? centerY = freezed,Object? faceWidth = freezed,}) {
  return _then(_FaceObservation(
yaw: null == yaw ? _self.yaw : yaw // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double,smilingProbability: freezed == smilingProbability ? _self.smilingProbability : smilingProbability // ignore: cast_nullable_to_non_nullable
as double?,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as int?,centerX: freezed == centerX ? _self.centerX : centerX // ignore: cast_nullable_to_non_nullable
as double?,centerY: freezed == centerY ? _self.centerY : centerY // ignore: cast_nullable_to_non_nullable
as double?,faceWidth: freezed == faceWidth ? _self.faceWidth : faceWidth // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
