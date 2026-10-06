// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationSessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationSessionEvent()';
}


}

/// @nodoc
class $VerificationSessionEventCopyWith<$Res>  {
$VerificationSessionEventCopyWith(VerificationSessionEvent _, $Res Function(VerificationSessionEvent) __);
}


/// Adds pattern-matching-related methods to [VerificationSessionEvent].
extension VerificationSessionEventPatterns on VerificationSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApplicantSubmitted value)?  applicantSubmitted,TResult Function( DocumentTypeSelected value)?  documentTypeSelected,TResult Function( DocumentCaptured value)?  documentCaptured,TResult Function( DocumentVerified value)?  documentVerified,TResult Function( LivenessPassed value)?  livenessPassed,TResult Function( FaceVerificationCompleted value)?  faceVerified,TResult Function( SessionReset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicantSubmitted() when applicantSubmitted != null:
return applicantSubmitted(_that);case DocumentTypeSelected() when documentTypeSelected != null:
return documentTypeSelected(_that);case DocumentCaptured() when documentCaptured != null:
return documentCaptured(_that);case DocumentVerified() when documentVerified != null:
return documentVerified(_that);case LivenessPassed() when livenessPassed != null:
return livenessPassed(_that);case FaceVerificationCompleted() when faceVerified != null:
return faceVerified(_that);case SessionReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApplicantSubmitted value)  applicantSubmitted,required TResult Function( DocumentTypeSelected value)  documentTypeSelected,required TResult Function( DocumentCaptured value)  documentCaptured,required TResult Function( DocumentVerified value)  documentVerified,required TResult Function( LivenessPassed value)  livenessPassed,required TResult Function( FaceVerificationCompleted value)  faceVerified,required TResult Function( SessionReset value)  reset,}){
final _that = this;
switch (_that) {
case ApplicantSubmitted():
return applicantSubmitted(_that);case DocumentTypeSelected():
return documentTypeSelected(_that);case DocumentCaptured():
return documentCaptured(_that);case DocumentVerified():
return documentVerified(_that);case LivenessPassed():
return livenessPassed(_that);case FaceVerificationCompleted():
return faceVerified(_that);case SessionReset():
return reset(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApplicantSubmitted value)?  applicantSubmitted,TResult? Function( DocumentTypeSelected value)?  documentTypeSelected,TResult? Function( DocumentCaptured value)?  documentCaptured,TResult? Function( DocumentVerified value)?  documentVerified,TResult? Function( LivenessPassed value)?  livenessPassed,TResult? Function( FaceVerificationCompleted value)?  faceVerified,TResult? Function( SessionReset value)?  reset,}){
final _that = this;
switch (_that) {
case ApplicantSubmitted() when applicantSubmitted != null:
return applicantSubmitted(_that);case DocumentTypeSelected() when documentTypeSelected != null:
return documentTypeSelected(_that);case DocumentCaptured() when documentCaptured != null:
return documentCaptured(_that);case DocumentVerified() when documentVerified != null:
return documentVerified(_that);case LivenessPassed() when livenessPassed != null:
return livenessPassed(_that);case FaceVerificationCompleted() when faceVerified != null:
return faceVerified(_that);case SessionReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Applicant applicant)?  applicantSubmitted,TResult Function( DocumentType documentType)?  documentTypeSelected,TResult Function( DocumentImage documentImage)?  documentCaptured,TResult Function( DocumentVerification verification)?  documentVerified,TResult Function( DocumentImage selfie)?  livenessPassed,TResult Function( FaceVerification verification)?  faceVerified,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicantSubmitted() when applicantSubmitted != null:
return applicantSubmitted(_that.applicant);case DocumentTypeSelected() when documentTypeSelected != null:
return documentTypeSelected(_that.documentType);case DocumentCaptured() when documentCaptured != null:
return documentCaptured(_that.documentImage);case DocumentVerified() when documentVerified != null:
return documentVerified(_that.verification);case LivenessPassed() when livenessPassed != null:
return livenessPassed(_that.selfie);case FaceVerificationCompleted() when faceVerified != null:
return faceVerified(_that.verification);case SessionReset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Applicant applicant)  applicantSubmitted,required TResult Function( DocumentType documentType)  documentTypeSelected,required TResult Function( DocumentImage documentImage)  documentCaptured,required TResult Function( DocumentVerification verification)  documentVerified,required TResult Function( DocumentImage selfie)  livenessPassed,required TResult Function( FaceVerification verification)  faceVerified,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case ApplicantSubmitted():
return applicantSubmitted(_that.applicant);case DocumentTypeSelected():
return documentTypeSelected(_that.documentType);case DocumentCaptured():
return documentCaptured(_that.documentImage);case DocumentVerified():
return documentVerified(_that.verification);case LivenessPassed():
return livenessPassed(_that.selfie);case FaceVerificationCompleted():
return faceVerified(_that.verification);case SessionReset():
return reset();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Applicant applicant)?  applicantSubmitted,TResult? Function( DocumentType documentType)?  documentTypeSelected,TResult? Function( DocumentImage documentImage)?  documentCaptured,TResult? Function( DocumentVerification verification)?  documentVerified,TResult? Function( DocumentImage selfie)?  livenessPassed,TResult? Function( FaceVerification verification)?  faceVerified,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case ApplicantSubmitted() when applicantSubmitted != null:
return applicantSubmitted(_that.applicant);case DocumentTypeSelected() when documentTypeSelected != null:
return documentTypeSelected(_that.documentType);case DocumentCaptured() when documentCaptured != null:
return documentCaptured(_that.documentImage);case DocumentVerified() when documentVerified != null:
return documentVerified(_that.verification);case LivenessPassed() when livenessPassed != null:
return livenessPassed(_that.selfie);case FaceVerificationCompleted() when faceVerified != null:
return faceVerified(_that.verification);case SessionReset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class ApplicantSubmitted implements VerificationSessionEvent {
  const ApplicantSubmitted(this.applicant);
  

 final  Applicant applicant;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicantSubmittedCopyWith<ApplicantSubmitted> get copyWith => _$ApplicantSubmittedCopyWithImpl<ApplicantSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicantSubmitted&&(identical(other.applicant, applicant) || other.applicant == applicant));
}


@override
int get hashCode => Object.hash(runtimeType,applicant);

@override
String toString() {
  return 'VerificationSessionEvent.applicantSubmitted(applicant: $applicant)';
}


}

/// @nodoc
abstract mixin class $ApplicantSubmittedCopyWith<$Res> implements $VerificationSessionEventCopyWith<$Res> {
  factory $ApplicantSubmittedCopyWith(ApplicantSubmitted value, $Res Function(ApplicantSubmitted) _then) = _$ApplicantSubmittedCopyWithImpl;
@useResult
$Res call({
 Applicant applicant
});


$ApplicantCopyWith<$Res> get applicant;

}
/// @nodoc
class _$ApplicantSubmittedCopyWithImpl<$Res>
    implements $ApplicantSubmittedCopyWith<$Res> {
  _$ApplicantSubmittedCopyWithImpl(this._self, this._then);

  final ApplicantSubmitted _self;
  final $Res Function(ApplicantSubmitted) _then;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicant = null,}) {
  return _then(ApplicantSubmitted(
null == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant,
  ));
}

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res> get applicant {
  
  return $ApplicantCopyWith<$Res>(_self.applicant, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}
}

/// @nodoc


class DocumentTypeSelected implements VerificationSessionEvent {
  const DocumentTypeSelected(this.documentType);
  

 final  DocumentType documentType;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentTypeSelectedCopyWith<DocumentTypeSelected> get copyWith => _$DocumentTypeSelectedCopyWithImpl<DocumentTypeSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentTypeSelected&&(identical(other.documentType, documentType) || other.documentType == documentType));
}


@override
int get hashCode => Object.hash(runtimeType,documentType);

@override
String toString() {
  return 'VerificationSessionEvent.documentTypeSelected(documentType: $documentType)';
}


}

/// @nodoc
abstract mixin class $DocumentTypeSelectedCopyWith<$Res> implements $VerificationSessionEventCopyWith<$Res> {
  factory $DocumentTypeSelectedCopyWith(DocumentTypeSelected value, $Res Function(DocumentTypeSelected) _then) = _$DocumentTypeSelectedCopyWithImpl;
@useResult
$Res call({
 DocumentType documentType
});




}
/// @nodoc
class _$DocumentTypeSelectedCopyWithImpl<$Res>
    implements $DocumentTypeSelectedCopyWith<$Res> {
  _$DocumentTypeSelectedCopyWithImpl(this._self, this._then);

  final DocumentTypeSelected _self;
  final $Res Function(DocumentTypeSelected) _then;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentType = null,}) {
  return _then(DocumentTypeSelected(
null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,
  ));
}


}

/// @nodoc


class DocumentCaptured implements VerificationSessionEvent {
  const DocumentCaptured(this.documentImage);
  

 final  DocumentImage documentImage;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentCapturedCopyWith<DocumentCaptured> get copyWith => _$DocumentCapturedCopyWithImpl<DocumentCaptured>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentCaptured&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage));
}


@override
int get hashCode => Object.hash(runtimeType,documentImage);

@override
String toString() {
  return 'VerificationSessionEvent.documentCaptured(documentImage: $documentImage)';
}


}

/// @nodoc
abstract mixin class $DocumentCapturedCopyWith<$Res> implements $VerificationSessionEventCopyWith<$Res> {
  factory $DocumentCapturedCopyWith(DocumentCaptured value, $Res Function(DocumentCaptured) _then) = _$DocumentCapturedCopyWithImpl;
@useResult
$Res call({
 DocumentImage documentImage
});


$DocumentImageCopyWith<$Res> get documentImage;

}
/// @nodoc
class _$DocumentCapturedCopyWithImpl<$Res>
    implements $DocumentCapturedCopyWith<$Res> {
  _$DocumentCapturedCopyWithImpl(this._self, this._then);

  final DocumentCaptured _self;
  final $Res Function(DocumentCaptured) _then;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentImage = null,}) {
  return _then(DocumentCaptured(
null == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage,
  ));
}

/// Create a copy of VerificationSessionEvent
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


class DocumentVerified implements VerificationSessionEvent {
  const DocumentVerified(this.verification);
  

 final  DocumentVerification verification;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentVerifiedCopyWith<DocumentVerified> get copyWith => _$DocumentVerifiedCopyWithImpl<DocumentVerified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentVerified&&(identical(other.verification, verification) || other.verification == verification));
}


@override
int get hashCode => Object.hash(runtimeType,verification);

@override
String toString() {
  return 'VerificationSessionEvent.documentVerified(verification: $verification)';
}


}

/// @nodoc
abstract mixin class $DocumentVerifiedCopyWith<$Res> implements $VerificationSessionEventCopyWith<$Res> {
  factory $DocumentVerifiedCopyWith(DocumentVerified value, $Res Function(DocumentVerified) _then) = _$DocumentVerifiedCopyWithImpl;
@useResult
$Res call({
 DocumentVerification verification
});


$DocumentVerificationCopyWith<$Res> get verification;

}
/// @nodoc
class _$DocumentVerifiedCopyWithImpl<$Res>
    implements $DocumentVerifiedCopyWith<$Res> {
  _$DocumentVerifiedCopyWithImpl(this._self, this._then);

  final DocumentVerified _self;
  final $Res Function(DocumentVerified) _then;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verification = null,}) {
  return _then(DocumentVerified(
null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as DocumentVerification,
  ));
}

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentVerificationCopyWith<$Res> get verification {
  
  return $DocumentVerificationCopyWith<$Res>(_self.verification, (value) {
    return _then(_self.copyWith(verification: value));
  });
}
}

/// @nodoc


class LivenessPassed implements VerificationSessionEvent {
  const LivenessPassed(this.selfie);
  

 final  DocumentImage selfie;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessPassedCopyWith<LivenessPassed> get copyWith => _$LivenessPassedCopyWithImpl<LivenessPassed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessPassed&&(identical(other.selfie, selfie) || other.selfie == selfie));
}


@override
int get hashCode => Object.hash(runtimeType,selfie);

@override
String toString() {
  return 'VerificationSessionEvent.livenessPassed(selfie: $selfie)';
}


}

/// @nodoc
abstract mixin class $LivenessPassedCopyWith<$Res> implements $VerificationSessionEventCopyWith<$Res> {
  factory $LivenessPassedCopyWith(LivenessPassed value, $Res Function(LivenessPassed) _then) = _$LivenessPassedCopyWithImpl;
@useResult
$Res call({
 DocumentImage selfie
});


$DocumentImageCopyWith<$Res> get selfie;

}
/// @nodoc
class _$LivenessPassedCopyWithImpl<$Res>
    implements $LivenessPassedCopyWith<$Res> {
  _$LivenessPassedCopyWithImpl(this._self, this._then);

  final LivenessPassed _self;
  final $Res Function(LivenessPassed) _then;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selfie = null,}) {
  return _then(LivenessPassed(
null == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage,
  ));
}

/// Create a copy of VerificationSessionEvent
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


class FaceVerificationCompleted implements VerificationSessionEvent {
  const FaceVerificationCompleted(this.verification);
  

 final  FaceVerification verification;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceVerificationCompletedCopyWith<FaceVerificationCompleted> get copyWith => _$FaceVerificationCompletedCopyWithImpl<FaceVerificationCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceVerificationCompleted&&(identical(other.verification, verification) || other.verification == verification));
}


@override
int get hashCode => Object.hash(runtimeType,verification);

@override
String toString() {
  return 'VerificationSessionEvent.faceVerified(verification: $verification)';
}


}

/// @nodoc
abstract mixin class $FaceVerificationCompletedCopyWith<$Res> implements $VerificationSessionEventCopyWith<$Res> {
  factory $FaceVerificationCompletedCopyWith(FaceVerificationCompleted value, $Res Function(FaceVerificationCompleted) _then) = _$FaceVerificationCompletedCopyWithImpl;
@useResult
$Res call({
 FaceVerification verification
});


$FaceVerificationCopyWith<$Res> get verification;

}
/// @nodoc
class _$FaceVerificationCompletedCopyWithImpl<$Res>
    implements $FaceVerificationCompletedCopyWith<$Res> {
  _$FaceVerificationCompletedCopyWithImpl(this._self, this._then);

  final FaceVerificationCompleted _self;
  final $Res Function(FaceVerificationCompleted) _then;

/// Create a copy of VerificationSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verification = null,}) {
  return _then(FaceVerificationCompleted(
null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as FaceVerification,
  ));
}

/// Create a copy of VerificationSessionEvent
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


class SessionReset implements VerificationSessionEvent {
  const SessionReset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationSessionEvent.reset()';
}


}




/// @nodoc
mixin _$VerificationSessionState {

 Applicant? get applicant; DocumentType? get documentType; DocumentImage? get documentImage; DocumentVerification? get documentVerification;/// Photo taken at the end of a passed liveness check.
 DocumentImage? get selfie; FaceVerification? get faceVerification;
/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationSessionStateCopyWith<VerificationSessionState> get copyWith => _$VerificationSessionStateCopyWithImpl<VerificationSessionState>(this as VerificationSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationSessionState&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.faceVerification, faceVerification) || other.faceVerification == faceVerification));
}


@override
int get hashCode => Object.hash(runtimeType,applicant,documentType,documentImage,documentVerification,selfie,faceVerification);

@override
String toString() {
  return 'VerificationSessionState(applicant: $applicant, documentType: $documentType, documentImage: $documentImage, documentVerification: $documentVerification, selfie: $selfie, faceVerification: $faceVerification)';
}


}

/// @nodoc
abstract mixin class $VerificationSessionStateCopyWith<$Res>  {
  factory $VerificationSessionStateCopyWith(VerificationSessionState value, $Res Function(VerificationSessionState) _then) = _$VerificationSessionStateCopyWithImpl;
@useResult
$Res call({
 Applicant? applicant, DocumentType? documentType, DocumentImage? documentImage, DocumentVerification? documentVerification, DocumentImage? selfie, FaceVerification? faceVerification
});


$ApplicantCopyWith<$Res>? get applicant;$DocumentImageCopyWith<$Res>? get documentImage;$DocumentVerificationCopyWith<$Res>? get documentVerification;$DocumentImageCopyWith<$Res>? get selfie;$FaceVerificationCopyWith<$Res>? get faceVerification;

}
/// @nodoc
class _$VerificationSessionStateCopyWithImpl<$Res>
    implements $VerificationSessionStateCopyWith<$Res> {
  _$VerificationSessionStateCopyWithImpl(this._self, this._then);

  final VerificationSessionState _self;
  final $Res Function(VerificationSessionState) _then;

/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicant = freezed,Object? documentType = freezed,Object? documentImage = freezed,Object? documentVerification = freezed,Object? selfie = freezed,Object? faceVerification = freezed,}) {
  return _then(_self.copyWith(
applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType?,documentImage: freezed == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerification?,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage?,faceVerification: freezed == faceVerification ? _self.faceVerification : faceVerification // ignore: cast_nullable_to_non_nullable
as FaceVerification?,
  ));
}
/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $ApplicantCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res>? get documentImage {
    if (_self.documentImage == null) {
    return null;
  }

  return $DocumentImageCopyWith<$Res>(_self.documentImage!, (value) {
    return _then(_self.copyWith(documentImage: value));
  });
}/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentVerificationCopyWith<$Res>? get documentVerification {
    if (_self.documentVerification == null) {
    return null;
  }

  return $DocumentVerificationCopyWith<$Res>(_self.documentVerification!, (value) {
    return _then(_self.copyWith(documentVerification: value));
  });
}/// Create a copy of VerificationSessionState
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
}/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceVerificationCopyWith<$Res>? get faceVerification {
    if (_self.faceVerification == null) {
    return null;
  }

  return $FaceVerificationCopyWith<$Res>(_self.faceVerification!, (value) {
    return _then(_self.copyWith(faceVerification: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerificationSessionState].
extension VerificationSessionStatePatterns on VerificationSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationSessionState value)  $default,){
final _that = this;
switch (_that) {
case _VerificationSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Applicant? applicant,  DocumentType? documentType,  DocumentImage? documentImage,  DocumentVerification? documentVerification,  DocumentImage? selfie,  FaceVerification? faceVerification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationSessionState() when $default != null:
return $default(_that.applicant,_that.documentType,_that.documentImage,_that.documentVerification,_that.selfie,_that.faceVerification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Applicant? applicant,  DocumentType? documentType,  DocumentImage? documentImage,  DocumentVerification? documentVerification,  DocumentImage? selfie,  FaceVerification? faceVerification)  $default,) {final _that = this;
switch (_that) {
case _VerificationSessionState():
return $default(_that.applicant,_that.documentType,_that.documentImage,_that.documentVerification,_that.selfie,_that.faceVerification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Applicant? applicant,  DocumentType? documentType,  DocumentImage? documentImage,  DocumentVerification? documentVerification,  DocumentImage? selfie,  FaceVerification? faceVerification)?  $default,) {final _that = this;
switch (_that) {
case _VerificationSessionState() when $default != null:
return $default(_that.applicant,_that.documentType,_that.documentImage,_that.documentVerification,_that.selfie,_that.faceVerification);case _:
  return null;

}
}

}

/// @nodoc


class _VerificationSessionState extends VerificationSessionState {
  const _VerificationSessionState({this.applicant, this.documentType, this.documentImage, this.documentVerification, this.selfie, this.faceVerification}): super._();
  

@override final  Applicant? applicant;
@override final  DocumentType? documentType;
@override final  DocumentImage? documentImage;
@override final  DocumentVerification? documentVerification;
/// Photo taken at the end of a passed liveness check.
@override final  DocumentImage? selfie;
@override final  FaceVerification? faceVerification;

/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationSessionStateCopyWith<_VerificationSessionState> get copyWith => __$VerificationSessionStateCopyWithImpl<_VerificationSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationSessionState&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage)&&(identical(other.documentVerification, documentVerification) || other.documentVerification == documentVerification)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.faceVerification, faceVerification) || other.faceVerification == faceVerification));
}


@override
int get hashCode => Object.hash(runtimeType,applicant,documentType,documentImage,documentVerification,selfie,faceVerification);

@override
String toString() {
  return 'VerificationSessionState(applicant: $applicant, documentType: $documentType, documentImage: $documentImage, documentVerification: $documentVerification, selfie: $selfie, faceVerification: $faceVerification)';
}


}

/// @nodoc
abstract mixin class _$VerificationSessionStateCopyWith<$Res> implements $VerificationSessionStateCopyWith<$Res> {
  factory _$VerificationSessionStateCopyWith(_VerificationSessionState value, $Res Function(_VerificationSessionState) _then) = __$VerificationSessionStateCopyWithImpl;
@override @useResult
$Res call({
 Applicant? applicant, DocumentType? documentType, DocumentImage? documentImage, DocumentVerification? documentVerification, DocumentImage? selfie, FaceVerification? faceVerification
});


@override $ApplicantCopyWith<$Res>? get applicant;@override $DocumentImageCopyWith<$Res>? get documentImage;@override $DocumentVerificationCopyWith<$Res>? get documentVerification;@override $DocumentImageCopyWith<$Res>? get selfie;@override $FaceVerificationCopyWith<$Res>? get faceVerification;

}
/// @nodoc
class __$VerificationSessionStateCopyWithImpl<$Res>
    implements _$VerificationSessionStateCopyWith<$Res> {
  __$VerificationSessionStateCopyWithImpl(this._self, this._then);

  final _VerificationSessionState _self;
  final $Res Function(_VerificationSessionState) _then;

/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicant = freezed,Object? documentType = freezed,Object? documentImage = freezed,Object? documentVerification = freezed,Object? selfie = freezed,Object? faceVerification = freezed,}) {
  return _then(_VerificationSessionState(
applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant?,documentType: freezed == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType?,documentImage: freezed == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage?,documentVerification: freezed == documentVerification ? _self.documentVerification : documentVerification // ignore: cast_nullable_to_non_nullable
as DocumentVerification?,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as DocumentImage?,faceVerification: freezed == faceVerification ? _self.faceVerification : faceVerification // ignore: cast_nullable_to_non_nullable
as FaceVerification?,
  ));
}

/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $ApplicantCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res>? get documentImage {
    if (_self.documentImage == null) {
    return null;
  }

  return $DocumentImageCopyWith<$Res>(_self.documentImage!, (value) {
    return _then(_self.copyWith(documentImage: value));
  });
}/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentVerificationCopyWith<$Res>? get documentVerification {
    if (_self.documentVerification == null) {
    return null;
  }

  return $DocumentVerificationCopyWith<$Res>(_self.documentVerification!, (value) {
    return _then(_self.copyWith(documentVerification: value));
  });
}/// Create a copy of VerificationSessionState
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
}/// Create a copy of VerificationSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceVerificationCopyWith<$Res>? get faceVerification {
    if (_self.faceVerification == null) {
    return null;
  }

  return $FaceVerificationCopyWith<$Res>(_self.faceVerification!, (value) {
    return _then(_self.copyWith(faceVerification: value));
  });
}
}

// dart format on
