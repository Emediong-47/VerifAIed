// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LivenessEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LivenessEvent()';
}


}

/// @nodoc
class $LivenessEventCopyWith<$Res>  {
$LivenessEventCopyWith(LivenessEvent _, $Res Function(LivenessEvent) __);
}


/// Adds pattern-matching-related methods to [LivenessEvent].
extension LivenessEventPatterns on LivenessEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LivenessStarted value)?  started,TResult Function( FacesDetected value)?  facesDetected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LivenessStarted() when started != null:
return started(_that);case FacesDetected() when facesDetected != null:
return facesDetected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LivenessStarted value)  started,required TResult Function( FacesDetected value)  facesDetected,}){
final _that = this;
switch (_that) {
case LivenessStarted():
return started(_that);case FacesDetected():
return facesDetected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LivenessStarted value)?  started,TResult? Function( FacesDetected value)?  facesDetected,}){
final _that = this;
switch (_that) {
case LivenessStarted() when started != null:
return started(_that);case FacesDetected() when facesDetected != null:
return facesDetected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( List<FaceObservation> faces)?  facesDetected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LivenessStarted() when started != null:
return started();case FacesDetected() when facesDetected != null:
return facesDetected(_that.faces);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( List<FaceObservation> faces)  facesDetected,}) {final _that = this;
switch (_that) {
case LivenessStarted():
return started();case FacesDetected():
return facesDetected(_that.faces);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( List<FaceObservation> faces)?  facesDetected,}) {final _that = this;
switch (_that) {
case LivenessStarted() when started != null:
return started();case FacesDetected() when facesDetected != null:
return facesDetected(_that.faces);case _:
  return null;

}
}

}

/// @nodoc


class LivenessStarted implements LivenessEvent {
  const LivenessStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LivenessEvent.started()';
}


}




/// @nodoc


class FacesDetected implements LivenessEvent {
  const FacesDetected(final  List<FaceObservation> faces): _faces = faces;
  

 final  List<FaceObservation> _faces;
 List<FaceObservation> get faces {
  if (_faces is EqualUnmodifiableListView) return _faces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faces);
}


/// Create a copy of LivenessEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacesDetectedCopyWith<FacesDetected> get copyWith => _$FacesDetectedCopyWithImpl<FacesDetected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacesDetected&&const DeepCollectionEquality().equals(other._faces, _faces));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_faces));

@override
String toString() {
  return 'LivenessEvent.facesDetected(faces: $faces)';
}


}

/// @nodoc
abstract mixin class $FacesDetectedCopyWith<$Res> implements $LivenessEventCopyWith<$Res> {
  factory $FacesDetectedCopyWith(FacesDetected value, $Res Function(FacesDetected) _then) = _$FacesDetectedCopyWithImpl;
@useResult
$Res call({
 List<FaceObservation> faces
});




}
/// @nodoc
class _$FacesDetectedCopyWithImpl<$Res>
    implements $FacesDetectedCopyWith<$Res> {
  _$FacesDetectedCopyWithImpl(this._self, this._then);

  final FacesDetected _self;
  final $Res Function(FacesDetected) _then;

/// Create a copy of LivenessEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? faces = null,}) {
  return _then(FacesDetected(
null == faces ? _self._faces : faces // ignore: cast_nullable_to_non_nullable
as List<FaceObservation>,
  ));
}


}

/// @nodoc
mixin _$LivenessState {

 LivenessStatus get status; LivenessCheck? get check;/// Consecutive frames meeting the current challenge, or while holding
/// still, consecutive well-placed frames.
 int get matchingFrames; int? get trackingId; FaceGuidance get guidance; DocumentImage? get selfie; Failure? get failure;
/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessStateCopyWith<LivenessState> get copyWith => _$LivenessStateCopyWithImpl<LivenessState>(this as LivenessState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessState&&(identical(other.status, status) || other.status == status)&&(identical(other.check, check) || other.check == check)&&(identical(other.matchingFrames, matchingFrames) || other.matchingFrames == matchingFrames)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId)&&(identical(other.guidance, guidance) || other.guidance == guidance)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,check,matchingFrames,trackingId,guidance,selfie,failure);

@override
String toString() {
  return 'LivenessState(status: $status, check: $check, matchingFrames: $matchingFrames, trackingId: $trackingId, guidance: $guidance, selfie: $selfie, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $LivenessStateCopyWith<$Res>  {
  factory $LivenessStateCopyWith(LivenessState value, $Res Function(LivenessState) _then) = _$LivenessStateCopyWithImpl;
@useResult
$Res call({
 LivenessStatus status, LivenessCheck? check, int matchingFrames, int? trackingId, FaceGuidance guidance, DocumentImage? selfie, Failure? failure
});


$LivenessCheckCopyWith<$Res>? get check;$DocumentImageCopyWith<$Res>? get selfie;

}
/// @nodoc
class _$LivenessStateCopyWithImpl<$Res>
    implements $LivenessStateCopyWith<$Res> {
  _$LivenessStateCopyWithImpl(this._self, this._then);

  final LivenessState _self;
  final $Res Function(LivenessState) _then;

/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? check = freezed,Object? matchingFrames = null,Object? trackingId = freezed,Object? guidance = null,Object? selfie = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LivenessStatus,check: freezed == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as LivenessCheck?,matchingFrames: null == matchingFrames ? _self.matchingFrames : matchingFrames // ignore: cast_nullable_to_non_nullable
as int,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as int?,guidance: null == guidance ? _self.guidance : guidance // ignore: cast_nullable_to_non_nullable
as FaceGuidance,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivenessCheckCopyWith<$Res>? get check {
    if (_self.check == null) {
    return null;
  }

  return $LivenessCheckCopyWith<$Res>(_self.check!, (value) {
    return _then(_self.copyWith(check: value));
  });
}/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res>? get selfie {
    if (_self.selfie == null) {
    return null;
  }

  return $DocumentImageCopyWith<$Res>(_self.selfie!, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}


/// Adds pattern-matching-related methods to [LivenessState].
extension LivenessStatePatterns on LivenessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivenessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivenessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivenessState value)  $default,){
final _that = this;
switch (_that) {
case _LivenessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivenessState value)?  $default,){
final _that = this;
switch (_that) {
case _LivenessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LivenessStatus status,  LivenessCheck? check,  int matchingFrames,  int? trackingId,  FaceGuidance guidance,  DocumentImage? selfie,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivenessState() when $default != null:
return $default(_that.status,_that.check,_that.matchingFrames,_that.trackingId,_that.guidance,_that.selfie,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LivenessStatus status,  LivenessCheck? check,  int matchingFrames,  int? trackingId,  FaceGuidance guidance,  DocumentImage? selfie,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _LivenessState():
return $default(_that.status,_that.check,_that.matchingFrames,_that.trackingId,_that.guidance,_that.selfie,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LivenessStatus status,  LivenessCheck? check,  int matchingFrames,  int? trackingId,  FaceGuidance guidance,  DocumentImage? selfie,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _LivenessState() when $default != null:
return $default(_that.status,_that.check,_that.matchingFrames,_that.trackingId,_that.guidance,_that.selfie,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _LivenessState implements LivenessState {
  const _LivenessState({this.status = LivenessStatus.initial, this.check, this.matchingFrames = 0, this.trackingId, this.guidance = FaceGuidance.none, this.selfie, this.failure});
  

@override@JsonKey() final  LivenessStatus status;
@override final  LivenessCheck? check;
/// Consecutive frames meeting the current challenge, or while holding
/// still, consecutive well-placed frames.
@override@JsonKey() final  int matchingFrames;
@override final  int? trackingId;
@override@JsonKey() final  FaceGuidance guidance;
@override final  DocumentImage? selfie;
@override final  Failure? failure;

/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivenessStateCopyWith<_LivenessState> get copyWith => __$LivenessStateCopyWithImpl<_LivenessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivenessState&&(identical(other.status, status) || other.status == status)&&(identical(other.check, check) || other.check == check)&&(identical(other.matchingFrames, matchingFrames) || other.matchingFrames == matchingFrames)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId)&&(identical(other.guidance, guidance) || other.guidance == guidance)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,check,matchingFrames,trackingId,guidance,selfie,failure);

@override
String toString() {
  return 'LivenessState(status: $status, check: $check, matchingFrames: $matchingFrames, trackingId: $trackingId, guidance: $guidance, selfie: $selfie, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$LivenessStateCopyWith<$Res> implements $LivenessStateCopyWith<$Res> {
  factory _$LivenessStateCopyWith(_LivenessState value, $Res Function(_LivenessState) _then) = __$LivenessStateCopyWithImpl;
@override @useResult
$Res call({
 LivenessStatus status, LivenessCheck? check, int matchingFrames, int? trackingId, FaceGuidance guidance, DocumentImage? selfie, Failure? failure
});


@override $LivenessCheckCopyWith<$Res>? get check;@override $DocumentImageCopyWith<$Res>? get selfie;

}
/// @nodoc
class __$LivenessStateCopyWithImpl<$Res>
    implements _$LivenessStateCopyWith<$Res> {
  __$LivenessStateCopyWithImpl(this._self, this._then);

  final _LivenessState _self;
  final $Res Function(_LivenessState) _then;

/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? check = freezed,Object? matchingFrames = null,Object? trackingId = freezed,Object? guidance = null,Object? selfie = freezed,Object? failure = freezed,}) {
  return _then(_LivenessState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LivenessStatus,check: freezed == check ? _self.check : check // ignore: cast_nullable_to_non_nullable
as LivenessCheck?,matchingFrames: null == matchingFrames ? _self.matchingFrames : matchingFrames // ignore: cast_nullable_to_non_nullable
as int,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as int?,guidance: null == guidance ? _self.guidance : guidance // ignore: cast_nullable_to_non_nullable
as FaceGuidance,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivenessCheckCopyWith<$Res>? get check {
    if (_self.check == null) {
    return null;
  }

  return $LivenessCheckCopyWith<$Res>(_self.check!, (value) {
    return _then(_self.copyWith(check: value));
  });
}/// Create a copy of LivenessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res>? get selfie {
    if (_self.selfie == null) {
    return null;
  }

  return $DocumentImageCopyWith<$Res>(_self.selfie!, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}

// dart format on
