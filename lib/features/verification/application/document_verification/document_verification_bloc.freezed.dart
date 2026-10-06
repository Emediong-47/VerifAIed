// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DocumentVerificationEvent {

 Applicant get applicant; DocumentType get documentType; DocumentImage get documentImage;
/// Create a copy of DocumentVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentVerificationEventCopyWith<DocumentVerificationEvent> get copyWith => _$DocumentVerificationEventCopyWithImpl<DocumentVerificationEvent>(this as DocumentVerificationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentVerificationEvent&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage));
}


@override
int get hashCode => Object.hash(runtimeType,applicant,documentType,documentImage);

@override
String toString() {
  return 'DocumentVerificationEvent(applicant: $applicant, documentType: $documentType, documentImage: $documentImage)';
}


}

/// @nodoc
abstract mixin class $DocumentVerificationEventCopyWith<$Res>  {
  factory $DocumentVerificationEventCopyWith(DocumentVerificationEvent value, $Res Function(DocumentVerificationEvent) _then) = _$DocumentVerificationEventCopyWithImpl;
@useResult
$Res call({
 Applicant applicant, DocumentType documentType, DocumentImage documentImage
});


$ApplicantCopyWith<$Res> get applicant;$DocumentImageCopyWith<$Res> get documentImage;

}
/// @nodoc
class _$DocumentVerificationEventCopyWithImpl<$Res>
    implements $DocumentVerificationEventCopyWith<$Res> {
  _$DocumentVerificationEventCopyWithImpl(this._self, this._then);

  final DocumentVerificationEvent _self;
  final $Res Function(DocumentVerificationEvent) _then;

/// Create a copy of DocumentVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicant = null,Object? documentType = null,Object? documentImage = null,}) {
  return _then(_self.copyWith(
applicant: null == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,documentImage: null == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage,
  ));
}
/// Create a copy of DocumentVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res> get applicant {
  
  return $ApplicantCopyWith<$Res>(_self.applicant, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of DocumentVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentImageCopyWith<$Res> get documentImage {
  
  return $DocumentImageCopyWith<$Res>(_self.documentImage, (value) {
    return _then(_self.copyWith(documentImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [DocumentVerificationEvent].
extension DocumentVerificationEventPatterns on DocumentVerificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DocumentVerificationStarted value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DocumentVerificationStarted() when started != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DocumentVerificationStarted value)  started,}){
final _that = this;
switch (_that) {
case DocumentVerificationStarted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DocumentVerificationStarted value)?  started,}){
final _that = this;
switch (_that) {
case DocumentVerificationStarted() when started != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Applicant applicant,  DocumentType documentType,  DocumentImage documentImage)?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DocumentVerificationStarted() when started != null:
return started(_that.applicant,_that.documentType,_that.documentImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Applicant applicant,  DocumentType documentType,  DocumentImage documentImage)  started,}) {final _that = this;
switch (_that) {
case DocumentVerificationStarted():
return started(_that.applicant,_that.documentType,_that.documentImage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Applicant applicant,  DocumentType documentType,  DocumentImage documentImage)?  started,}) {final _that = this;
switch (_that) {
case DocumentVerificationStarted() when started != null:
return started(_that.applicant,_that.documentType,_that.documentImage);case _:
  return null;

}
}

}

/// @nodoc


class DocumentVerificationStarted implements DocumentVerificationEvent {
  const DocumentVerificationStarted({required this.applicant, required this.documentType, required this.documentImage});
  

@override final  Applicant applicant;
@override final  DocumentType documentType;
@override final  DocumentImage documentImage;

/// Create a copy of DocumentVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentVerificationStartedCopyWith<DocumentVerificationStarted> get copyWith => _$DocumentVerificationStartedCopyWithImpl<DocumentVerificationStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentVerificationStarted&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.documentImage, documentImage) || other.documentImage == documentImage));
}


@override
int get hashCode => Object.hash(runtimeType,applicant,documentType,documentImage);

@override
String toString() {
  return 'DocumentVerificationEvent.started(applicant: $applicant, documentType: $documentType, documentImage: $documentImage)';
}


}

/// @nodoc
abstract mixin class $DocumentVerificationStartedCopyWith<$Res> implements $DocumentVerificationEventCopyWith<$Res> {
  factory $DocumentVerificationStartedCopyWith(DocumentVerificationStarted value, $Res Function(DocumentVerificationStarted) _then) = _$DocumentVerificationStartedCopyWithImpl;
@override @useResult
$Res call({
 Applicant applicant, DocumentType documentType, DocumentImage documentImage
});


@override $ApplicantCopyWith<$Res> get applicant;@override $DocumentImageCopyWith<$Res> get documentImage;

}
/// @nodoc
class _$DocumentVerificationStartedCopyWithImpl<$Res>
    implements $DocumentVerificationStartedCopyWith<$Res> {
  _$DocumentVerificationStartedCopyWithImpl(this._self, this._then);

  final DocumentVerificationStarted _self;
  final $Res Function(DocumentVerificationStarted) _then;

/// Create a copy of DocumentVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicant = null,Object? documentType = null,Object? documentImage = null,}) {
  return _then(DocumentVerificationStarted(
applicant: null == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as Applicant,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,documentImage: null == documentImage ? _self.documentImage : documentImage // ignore: cast_nullable_to_non_nullable
as DocumentImage,
  ));
}

/// Create a copy of DocumentVerificationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicantCopyWith<$Res> get applicant {
  
  return $ApplicantCopyWith<$Res>(_self.applicant, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of DocumentVerificationEvent
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
mixin _$DocumentVerificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentVerificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentVerificationState()';
}


}

/// @nodoc
class $DocumentVerificationStateCopyWith<$Res>  {
$DocumentVerificationStateCopyWith(DocumentVerificationState _, $Res Function(DocumentVerificationState) __);
}


/// Adds pattern-matching-related methods to [DocumentVerificationState].
extension DocumentVerificationStatePatterns on DocumentVerificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VerificationInitial value)?  initial,TResult Function( Verifying value)?  verifying,TResult Function( Verified value)?  verified,TResult Function( VerificationFailed value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VerificationInitial() when initial != null:
return initial(_that);case Verifying() when verifying != null:
return verifying(_that);case Verified() when verified != null:
return verified(_that);case VerificationFailed() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VerificationInitial value)  initial,required TResult Function( Verifying value)  verifying,required TResult Function( Verified value)  verified,required TResult Function( VerificationFailed value)  failure,}){
final _that = this;
switch (_that) {
case VerificationInitial():
return initial(_that);case Verifying():
return verifying(_that);case Verified():
return verified(_that);case VerificationFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VerificationInitial value)?  initial,TResult? Function( Verifying value)?  verifying,TResult? Function( Verified value)?  verified,TResult? Function( VerificationFailed value)?  failure,}){
final _that = this;
switch (_that) {
case VerificationInitial() when initial != null:
return initial(_that);case Verifying() when verifying != null:
return verifying(_that);case Verified() when verified != null:
return verified(_that);case VerificationFailed() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  verifying,TResult Function( DocumentVerification verification)?  verified,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VerificationInitial() when initial != null:
return initial();case Verifying() when verifying != null:
return verifying();case Verified() when verified != null:
return verified(_that.verification);case VerificationFailed() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  verifying,required TResult Function( DocumentVerification verification)  verified,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case VerificationInitial():
return initial();case Verifying():
return verifying();case Verified():
return verified(_that.verification);case VerificationFailed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  verifying,TResult? Function( DocumentVerification verification)?  verified,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case VerificationInitial() when initial != null:
return initial();case Verifying() when verifying != null:
return verifying();case Verified() when verified != null:
return verified(_that.verification);case VerificationFailed() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class VerificationInitial implements DocumentVerificationState {
  const VerificationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentVerificationState.initial()';
}


}




/// @nodoc


class Verifying implements DocumentVerificationState {
  const Verifying();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Verifying);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentVerificationState.verifying()';
}


}




/// @nodoc


class Verified implements DocumentVerificationState {
  const Verified(this.verification);
  

 final  DocumentVerification verification;

/// Create a copy of DocumentVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifiedCopyWith<Verified> get copyWith => _$VerifiedCopyWithImpl<Verified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Verified&&(identical(other.verification, verification) || other.verification == verification));
}


@override
int get hashCode => Object.hash(runtimeType,verification);

@override
String toString() {
  return 'DocumentVerificationState.verified(verification: $verification)';
}


}

/// @nodoc
abstract mixin class $VerifiedCopyWith<$Res> implements $DocumentVerificationStateCopyWith<$Res> {
  factory $VerifiedCopyWith(Verified value, $Res Function(Verified) _then) = _$VerifiedCopyWithImpl;
@useResult
$Res call({
 DocumentVerification verification
});


$DocumentVerificationCopyWith<$Res> get verification;

}
/// @nodoc
class _$VerifiedCopyWithImpl<$Res>
    implements $VerifiedCopyWith<$Res> {
  _$VerifiedCopyWithImpl(this._self, this._then);

  final Verified _self;
  final $Res Function(Verified) _then;

/// Create a copy of DocumentVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verification = null,}) {
  return _then(Verified(
null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as DocumentVerification,
  ));
}

/// Create a copy of DocumentVerificationState
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


class VerificationFailed implements DocumentVerificationState {
  const VerificationFailed(this.failure);
  

 final  Failure failure;

/// Create a copy of DocumentVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationFailedCopyWith<VerificationFailed> get copyWith => _$VerificationFailedCopyWithImpl<VerificationFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationFailed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DocumentVerificationState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $VerificationFailedCopyWith<$Res> implements $DocumentVerificationStateCopyWith<$Res> {
  factory $VerificationFailedCopyWith(VerificationFailed value, $Res Function(VerificationFailed) _then) = _$VerificationFailedCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$VerificationFailedCopyWithImpl<$Res>
    implements $VerificationFailedCopyWith<$Res> {
  _$VerificationFailedCopyWithImpl(this._self, this._then);

  final VerificationFailed _self;
  final $Res Function(VerificationFailed) _then;

/// Create a copy of DocumentVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(VerificationFailed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
