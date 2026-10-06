// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceVerificationEvent {

 DocumentImage get documentImage; DocumentImage get selfie;
/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceVerificationEventCopyWith<FaceVerificationEvent> get copyWith => _$FaceVerificationEventCopyWithImpl<FaceVerificationEvent>(this as FaceVerificationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerificationEvent&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage)&&(identical(other.selfie, selfie) || other.selfie == selfie));
}


@override
int get hashCode => Object.hash(runtimeType,documentImage,selfie);

@override
String toString() {
  return 'FaceVerificationEvent(documentImage: $documentImage, selfie: $selfie)';
}


}

/// @nodoc
abstract mixin class $FaceVerificationEventCopyWith<$Res>  {
  factory $FaceVerificationEventCopyWith(FaceVerificationEvent value, $Res Function(FaceVerificationEvent) _then) = _$FaceVerificationEventCopyWithImpl;
@useResult
$Res call({
 DocumentImage documentImage, DocumentImage selfie
});


$DocumentImageCopyWith<$Res> get documentImage;$DocumentImageCopyWith<$Res> get selfie;

}
/// @nodoc
class _$FaceVerificationEventCopyWithImpl<$Res>
    implements $FaceVerificationEventCopyWith<$Res> {
  _$FaceVerificationEventCopyWithImpl(this._self, this._then);

  final FaceVerificationEvent _self;
  final $Res Function(FaceVerificationEvent) _then;

/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentImage = null,Object? selfie = null,}) {
  return _then(_self.copyWith(
documentImage: null == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage,
  ));
}
/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get documentImage {
  
  return $DocumentImageCopyWith<$Res>(_self.documentImage, (value) {
    return _then(_self.copyWith(documentImage: value));
  });
}/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get selfie {
  
  return $DocumentImageCopyWith<$Res>(_self.selfie, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}


/// Adds pattern-matching-related methods to [FaceVerificationEvent].
extension FaceVerificationEventPatterns on FaceVerificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FaceVerificationStarted value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FaceVerificationStarted() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FaceVerificationStarted value)  started,}){
final _that = this;
switch (_that) {
case FaceVerificationStarted():
return started(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FaceVerificationStarted value)?  started,}){
final _that = this;
switch (_that) {
case FaceVerificationStarted() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DocumentImage documentImage,  DocumentImage selfie)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FaceVerificationStarted() when started != null:
return started(_that.documentImage,_that.selfie);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DocumentImage documentImage,  DocumentImage selfie)  started,}) {final _that = this;
switch (_that) {
case FaceVerificationStarted():
return started(_that.documentImage,_that.selfie);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DocumentImage documentImage,  DocumentImage selfie)?  started,}) {final _that = this;
switch (_that) {
case FaceVerificationStarted() when started != null:
return started(_that.documentImage,_that.selfie);case _:
  return null;

}
}

}

/// @nodoc


class FaceVerificationStarted implements FaceVerificationEvent {
  const FaceVerificationStarted({required this.documentImage, required this.selfie});
  

@override final  DocumentImage documentImage;
@override final  DocumentImage selfie;

/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceVerificationStartedCopyWith<FaceVerificationStarted> get copyWith => _$FaceVerificationStartedCopyWithImpl<FaceVerificationStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerificationStarted&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage)&&(identical(other.selfie, selfie) || other.selfie == selfie));
}


@override
int get hashCode => Object.hash(runtimeType,documentImage,selfie);

@override
String toString() {
  return 'FaceVerificationEvent.started(documentImage: $documentImage, selfie: $selfie)';
}


}

/// @nodoc
abstract mixin class $FaceVerificationStartedCopyWith<$Res> implements $FaceVerificationEventCopyWith<$Res> {
  factory $FaceVerificationStartedCopyWith(FaceVerificationStarted value, $Res Function(FaceVerificationStarted) _then) = _$FaceVerificationStartedCopyWithImpl;
@override @useResult
$Res call({
 DocumentImage documentImage, DocumentImage selfie
});


@override $DocumentImageCopyWith<$Res> get documentImage;@override $DocumentImageCopyWith<$Res> get selfie;

}
/// @nodoc
class _$FaceVerificationStartedCopyWithImpl<$Res>
    implements $FaceVerificationStartedCopyWith<$Res> {
  _$FaceVerificationStartedCopyWithImpl(this._self, this._then);

  final FaceVerificationStarted _self;
  final $Res Function(FaceVerificationStarted) _then;

/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentImage = null,Object? selfie = null,}) {
  return _then(FaceVerificationStarted(
documentImage: null == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage,selfie: null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage,
  ));
}

/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get documentImage {
  
  return $DocumentImageCopyWith<$Res>(_self.documentImage, (value) {
    return _then(_self.copyWith(documentImage: value));
  });
}/// Create a copy of FaceVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get selfie {
  
  return $DocumentImageCopyWith<$Res>(_self.selfie, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}

/// @nodoc
mixin _$FaceVerificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FaceVerificationState()';
}


}

/// @nodoc
class $FaceVerificationStateCopyWith<$Res>  {
$FaceVerificationStateCopyWith(FaceVerificationState _, $Res Function(FaceVerificationState) __);
}


/// Adds pattern-matching-related methods to [FaceVerificationState].
extension FaceVerificationStatePatterns on FaceVerificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FaceVerificationInitial value)?  initial,TResult Function( FaceVerifying value)?  verifying,TResult Function( FaceVerified value)?  verified,TResult Function( FaceVerificationFailed value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FaceVerificationInitial() when initial != null:
return initial(_that);case FaceVerifying() when verifying != null:
return verifying(_that);case FaceVerified() when verified != null:
return verified(_that);case FaceVerificationFailed() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FaceVerificationInitial value)  initial,required TResult Function( FaceVerifying value)  verifying,required TResult Function( FaceVerified value)  verified,required TResult Function( FaceVerificationFailed value)  failure,}){
final _that = this;
switch (_that) {
case FaceVerificationInitial():
return initial(_that);case FaceVerifying():
return verifying(_that);case FaceVerified():
return verified(_that);case FaceVerificationFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FaceVerificationInitial value)?  initial,TResult? Function( FaceVerifying value)?  verifying,TResult? Function( FaceVerified value)?  verified,TResult? Function( FaceVerificationFailed value)?  failure,}){
final _that = this;
switch (_that) {
case FaceVerificationInitial() when initial != null:
return initial(_that);case FaceVerifying() when verifying != null:
return verifying(_that);case FaceVerified() when verified != null:
return verified(_that);case FaceVerificationFailed() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  verifying,TResult Function( FaceVerification verification)?  verified,TResult Function( Failure failure,  FacePhoto photo)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FaceVerificationInitial() when initial != null:
return initial();case FaceVerifying() when verifying != null:
return verifying();case FaceVerified() when verified != null:
return verified(_that.verification);case FaceVerificationFailed() when failure != null:
return failure(_that.failure,_that.photo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  verifying,required TResult Function( FaceVerification verification)  verified,required TResult Function( Failure failure,  FacePhoto photo)  failure,}) {final _that = this;
switch (_that) {
case FaceVerificationInitial():
return initial();case FaceVerifying():
return verifying();case FaceVerified():
return verified(_that.verification);case FaceVerificationFailed():
return failure(_that.failure,_that.photo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  verifying,TResult? Function( FaceVerification verification)?  verified,TResult? Function( Failure failure,  FacePhoto photo)?  failure,}) {final _that = this;
switch (_that) {
case FaceVerificationInitial() when initial != null:
return initial();case FaceVerifying() when verifying != null:
return verifying();case FaceVerified() when verified != null:
return verified(_that.verification);case FaceVerificationFailed() when failure != null:
return failure(_that.failure,_that.photo);case _:
  return null;

}
}

}

/// @nodoc


class FaceVerificationInitial implements FaceVerificationState {
  const FaceVerificationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerificationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FaceVerificationState.initial()';
}


}




/// @nodoc


class FaceVerifying implements FaceVerificationState {
  const FaceVerifying();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerifying);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FaceVerificationState.verifying()';
}


}




/// @nodoc


class FaceVerified implements FaceVerificationState {
  const FaceVerified(this.verification);
  

 final  FaceVerification verification;

/// Create a copy of FaceVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceVerifiedCopyWith<FaceVerified> get copyWith => _$FaceVerifiedCopyWithImpl<FaceVerified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerified&&(identical(other.verification, verification) || other.verification == verification));
}


@override
int get hashCode => Object.hash(runtimeType,verification);

@override
String toString() {
  return 'FaceVerificationState.verified(verification: $verification)';
}


}

/// @nodoc
abstract mixin class $FaceVerifiedCopyWith<$Res> implements $FaceVerificationStateCopyWith<$Res> {
  factory $FaceVerifiedCopyWith(FaceVerified value, $Res Function(FaceVerified) _then) = _$FaceVerifiedCopyWithImpl;
@useResult
$Res call({
 FaceVerification verification
});


$FaceVerificationCopyWith<$Res> get verification;

}
/// @nodoc
class _$FaceVerifiedCopyWithImpl<$Res>
    implements $FaceVerifiedCopyWith<$Res> {
  _$FaceVerifiedCopyWithImpl(this._self, this._then);

  final FaceVerified _self;
  final $Res Function(FaceVerified) _then;

/// Create a copy of FaceVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verification = null,}) {
  return _then(FaceVerified(
null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as FaceVerification,
  ));
}

/// Create a copy of FaceVerificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceVerificationCopyWith<$Res> get verification {
  
  return $FaceVerificationCopyWith<$Res>(_self.verification, (value) {
    return _then(_self.copyWith(verification: value));
  });
}
}

/// @nodoc


class FaceVerificationFailed implements FaceVerificationState {
  const FaceVerificationFailed(this.failure, this.photo);
  

 final  Failure failure;
 final  FacePhoto photo;

/// Create a copy of FaceVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceVerificationFailedCopyWith<FaceVerificationFailed> get copyWith => _$FaceVerificationFailedCopyWithImpl<FaceVerificationFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerificationFailed&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.photo, photo) || other.photo == photo));
}


@override
int get hashCode => Object.hash(runtimeType,failure,photo);

@override
String toString() {
  return 'FaceVerificationState.failure(failure: $failure, photo: $photo)';
}


}

/// @nodoc
abstract mixin class $FaceVerificationFailedCopyWith<$Res> implements $FaceVerificationStateCopyWith<$Res> {
  factory $FaceVerificationFailedCopyWith(FaceVerificationFailed value, $Res Function(FaceVerificationFailed) _then) = _$FaceVerificationFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure, FacePhoto photo
});




}
/// @nodoc
class _$FaceVerificationFailedCopyWithImpl<$Res>
    implements $FaceVerificationFailedCopyWith<$Res> {
  _$FaceVerificationFailedCopyWithImpl(this._self, this._then);

  final FaceVerificationFailed _self;
  final $Res Function(FaceVerificationFailed) _then;

/// Create a copy of FaceVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? photo = null,}) {
  return _then(FaceVerificationFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as FacePhoto,
  ));
}


}

// dart format on
