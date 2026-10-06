// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_voice_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LivenessVoiceEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessVoiceEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LivenessVoiceEvent()';
}


}

/// @nodoc
class $LivenessVoiceEventCopyWith<$Res>  {
$LivenessVoiceEventCopyWith(LivenessVoiceEvent _, $Res Function(LivenessVoiceEvent) __);
}


/// Adds pattern-matching-related methods to [LivenessVoiceEvent].
extension LivenessVoiceEventPatterns on LivenessVoiceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LivenessChanged value)?  livenessChanged,TResult Function( MuteToggled value)?  muteToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LivenessChanged() when livenessChanged != null:
return livenessChanged(_that);case MuteToggled() when muteToggled != null:
return muteToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LivenessChanged value)  livenessChanged,required TResult Function( MuteToggled value)  muteToggled,}){
final _that = this;
switch (_that) {
case LivenessChanged():
return livenessChanged(_that);case MuteToggled():
return muteToggled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LivenessChanged value)?  livenessChanged,TResult? Function( MuteToggled value)?  muteToggled,}){
final _that = this;
switch (_that) {
case LivenessChanged() when livenessChanged != null:
return livenessChanged(_that);case MuteToggled() when muteToggled != null:
return muteToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LivenessState state)?  livenessChanged,TResult Function()?  muteToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LivenessChanged() when livenessChanged != null:
return livenessChanged(_that.state);case MuteToggled() when muteToggled != null:
return muteToggled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LivenessState state)  livenessChanged,required TResult Function()  muteToggled,}) {final _that = this;
switch (_that) {
case LivenessChanged():
return livenessChanged(_that.state);case MuteToggled():
return muteToggled();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LivenessState state)?  livenessChanged,TResult? Function()?  muteToggled,}) {final _that = this;
switch (_that) {
case LivenessChanged() when livenessChanged != null:
return livenessChanged(_that.state);case MuteToggled() when muteToggled != null:
return muteToggled();case _:
  return null;

}
}

}

/// @nodoc


class LivenessChanged implements LivenessVoiceEvent {
  const LivenessChanged(this.state);
  

 final  LivenessState state;

/// Create a copy of LivenessVoiceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessChangedCopyWith<LivenessChanged> get copyWith => _$LivenessChangedCopyWithImpl<LivenessChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessChanged&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'LivenessVoiceEvent.livenessChanged(state: $state)';
}


}

/// @nodoc
abstract mixin class $LivenessChangedCopyWith<$Res> implements $LivenessVoiceEventCopyWith<$Res> {
  factory $LivenessChangedCopyWith(LivenessChanged value, $Res Function(LivenessChanged) _then) = _$LivenessChangedCopyWithImpl;
@useResult
$Res call({
 LivenessState state
});


$LivenessStateCopyWith<$Res> get state;

}
/// @nodoc
class _$LivenessChangedCopyWithImpl<$Res>
    implements $LivenessChangedCopyWith<$Res> {
  _$LivenessChangedCopyWithImpl(this._self, this._then);

  final LivenessChanged _self;
  final $Res Function(LivenessChanged) _then;

/// Create a copy of LivenessVoiceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(LivenessChanged(
null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as LivenessState,
  ));
}

/// Create a copy of LivenessVoiceEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivenessStateCopyWith<$Res> get state {
  
  return $LivenessStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

/// @nodoc


class MuteToggled implements LivenessVoiceEvent {
  const MuteToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LivenessVoiceEvent.muteToggled()';
}


}




/// @nodoc
mixin _$LivenessVoiceState {

 bool get muted;/// The most recent prompt spoken aloud.
 String? get lastSpoken;
/// Create a copy of LivenessVoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessVoiceStateCopyWith<LivenessVoiceState> get copyWith => _$LivenessVoiceStateCopyWithImpl<LivenessVoiceState>(this as LivenessVoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessVoiceState&&(identical(other.muted, muted) || other.muted == muted)&&(identical(other.lastSpoken, lastSpoken) || other.lastSpoken == lastSpoken));
}


@override
int get hashCode => Object.hash(runtimeType,muted,lastSpoken);

@override
String toString() {
  return 'LivenessVoiceState(muted: $muted, lastSpoken: $lastSpoken)';
}


}

/// @nodoc
abstract mixin class $LivenessVoiceStateCopyWith<$Res>  {
  factory $LivenessVoiceStateCopyWith(LivenessVoiceState value, $Res Function(LivenessVoiceState) _then) = _$LivenessVoiceStateCopyWithImpl;
@useResult
$Res call({
 bool muted, String? lastSpoken
});




}
/// @nodoc
class _$LivenessVoiceStateCopyWithImpl<$Res>
    implements $LivenessVoiceStateCopyWith<$Res> {
  _$LivenessVoiceStateCopyWithImpl(this._self, this._then);

  final LivenessVoiceState _self;
  final $Res Function(LivenessVoiceState) _then;

/// Create a copy of LivenessVoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? muted = null,Object? lastSpoken = freezed,}) {
  return _then(_self.copyWith(
muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as bool,lastSpoken: freezed == lastSpoken ? _self.lastSpoken : lastSpoken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LivenessVoiceState].
extension LivenessVoiceStatePatterns on LivenessVoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivenessVoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivenessVoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivenessVoiceState value)  $default,){
final _that = this;
switch (_that) {
case _LivenessVoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivenessVoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _LivenessVoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool muted,  String? lastSpoken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivenessVoiceState() when $default != null:
return $default(_that.muted,_that.lastSpoken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool muted,  String? lastSpoken)  $default,) {final _that = this;
switch (_that) {
case _LivenessVoiceState():
return $default(_that.muted,_that.lastSpoken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool muted,  String? lastSpoken)?  $default,) {final _that = this;
switch (_that) {
case _LivenessVoiceState() when $default != null:
return $default(_that.muted,_that.lastSpoken);case _:
  return null;

}
}

}

/// @nodoc


class _LivenessVoiceState implements LivenessVoiceState {
  const _LivenessVoiceState({this.muted = false, this.lastSpoken});
  

@override@JsonKey() final  bool muted;
/// The most recent prompt spoken aloud.
@override final  String? lastSpoken;

/// Create a copy of LivenessVoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivenessVoiceStateCopyWith<_LivenessVoiceState> get copyWith => __$LivenessVoiceStateCopyWithImpl<_LivenessVoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivenessVoiceState&&(identical(other.muted, muted) || other.muted == muted)&&(identical(other.lastSpoken, lastSpoken) || other.lastSpoken == lastSpoken));
}


@override
int get hashCode => Object.hash(runtimeType,muted,lastSpoken);

@override
String toString() {
  return 'LivenessVoiceState(muted: $muted, lastSpoken: $lastSpoken)';
}


}

/// @nodoc
abstract mixin class _$LivenessVoiceStateCopyWith<$Res> implements $LivenessVoiceStateCopyWith<$Res> {
  factory _$LivenessVoiceStateCopyWith(_LivenessVoiceState value, $Res Function(_LivenessVoiceState) _then) = __$LivenessVoiceStateCopyWithImpl;
@override @useResult
$Res call({
 bool muted, String? lastSpoken
});




}
/// @nodoc
class __$LivenessVoiceStateCopyWithImpl<$Res>
    implements _$LivenessVoiceStateCopyWith<$Res> {
  __$LivenessVoiceStateCopyWithImpl(this._self, this._then);

  final _LivenessVoiceState _self;
  final $Res Function(_LivenessVoiceState) _then;

/// Create a copy of LivenessVoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? muted = null,Object? lastSpoken = freezed,}) {
  return _then(_LivenessVoiceState(
muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as bool,lastSpoken: freezed == lastSpoken ? _self.lastSpoken : lastSpoken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
