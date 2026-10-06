// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_selection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DocumentSelectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSelectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentSelectionEvent()';
}


}

/// @nodoc
class $DocumentSelectionEventCopyWith<$Res>  {
$DocumentSelectionEventCopyWith(DocumentSelectionEvent _, $Res Function(DocumentSelectionEvent) __);
}


/// Adds pattern-matching-related methods to [DocumentSelectionEvent].
extension DocumentSelectionEventPatterns on DocumentSelectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DocumentTypeChanged value)?  documentTypeChanged,TResult Function( DocumentSelectionSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DocumentTypeChanged() when documentTypeChanged != null:
return documentTypeChanged(_that);case DocumentSelectionSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DocumentTypeChanged value)  documentTypeChanged,required TResult Function( DocumentSelectionSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case DocumentTypeChanged():
return documentTypeChanged(_that);case DocumentSelectionSubmitted():
return submitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DocumentTypeChanged value)?  documentTypeChanged,TResult? Function( DocumentSelectionSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case DocumentTypeChanged() when documentTypeChanged != null:
return documentTypeChanged(_that);case DocumentSelectionSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DocumentType documentType)?  documentTypeChanged,TResult Function()?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DocumentTypeChanged() when documentTypeChanged != null:
return documentTypeChanged(_that.documentType);case DocumentSelectionSubmitted() when submitted != null:
return submitted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DocumentType documentType)  documentTypeChanged,required TResult Function()  submitted,}) {final _that = this;
switch (_that) {
case DocumentTypeChanged():
return documentTypeChanged(_that.documentType);case DocumentSelectionSubmitted():
return submitted();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DocumentType documentType)?  documentTypeChanged,TResult? Function()?  submitted,}) {final _that = this;
switch (_that) {
case DocumentTypeChanged() when documentTypeChanged != null:
return documentTypeChanged(_that.documentType);case DocumentSelectionSubmitted() when submitted != null:
return submitted();case _:
  return null;

}
}

}

/// @nodoc


class DocumentTypeChanged implements DocumentSelectionEvent {
  const DocumentTypeChanged(this.documentType);
  

 final  DocumentType documentType;

/// Create a copy of DocumentSelectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentTypeChangedCopyWith<DocumentTypeChanged> get copyWith => _$DocumentTypeChangedCopyWithImpl<DocumentTypeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentTypeChanged&&(identical(other.documentType, documentType) || other.documentType == documentType));
}


@override
int get hashCode => Object.hash(runtimeType,documentType);

@override
String toString() {
  return 'DocumentSelectionEvent.documentTypeChanged(documentType: $documentType)';
}


}

/// @nodoc
abstract mixin class $DocumentTypeChangedCopyWith<$Res> implements $DocumentSelectionEventCopyWith<$Res> {
  factory $DocumentTypeChangedCopyWith(DocumentTypeChanged value, $Res Function(DocumentTypeChanged) _then) = _$DocumentTypeChangedCopyWithImpl;
@useResult
$Res call({
 DocumentType documentType
});




}
/// @nodoc
class _$DocumentTypeChangedCopyWithImpl<$Res>
    implements $DocumentTypeChangedCopyWith<$Res> {
  _$DocumentTypeChangedCopyWithImpl(this._self, this._then);

  final DocumentTypeChanged _self;
  final $Res Function(DocumentTypeChanged) _then;

/// Create a copy of DocumentSelectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentType = null,}) {
  return _then(DocumentTypeChanged(
null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as DocumentType,
  ));
}


}

/// @nodoc


class DocumentSelectionSubmitted implements DocumentSelectionEvent {
  const DocumentSelectionSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSelectionSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DocumentSelectionEvent.submitted()';
}


}




/// @nodoc
mixin _$DocumentSelectionState {

 DocumentType get selected; FormStatus get status;
/// Create a copy of DocumentSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentSelectionStateCopyWith<DocumentSelectionState> get copyWith => _$DocumentSelectionStateCopyWithImpl<DocumentSelectionState>(this as DocumentSelectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSelectionState&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,selected,status);

@override
String toString() {
  return 'DocumentSelectionState(selected: $selected, status: $status)';
}


}

/// @nodoc
abstract mixin class $DocumentSelectionStateCopyWith<$Res>  {
  factory $DocumentSelectionStateCopyWith(DocumentSelectionState value, $Res Function(DocumentSelectionState) _then) = _$DocumentSelectionStateCopyWithImpl;
@useResult
$Res call({
 DocumentType selected, FormStatus status
});




}
/// @nodoc
class _$DocumentSelectionStateCopyWithImpl<$Res>
    implements $DocumentSelectionStateCopyWith<$Res> {
  _$DocumentSelectionStateCopyWithImpl(this._self, this._then);

  final DocumentSelectionState _self;
  final $Res Function(DocumentSelectionState) _then;

/// Create a copy of DocumentSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selected = null,Object? status = null,}) {
  return _then(_self.copyWith(
selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as DocumentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentSelectionState].
extension DocumentSelectionStatePatterns on DocumentSelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentSelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentSelectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentSelectionState value)  $default,){
final _that = this;
switch (_that) {
case _DocumentSelectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentSelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentSelectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DocumentType selected,  FormStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentSelectionState() when $default != null:
return $default(_that.selected,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DocumentType selected,  FormStatus status)  $default,) {final _that = this;
switch (_that) {
case _DocumentSelectionState():
return $default(_that.selected,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DocumentType selected,  FormStatus status)?  $default,) {final _that = this;
switch (_that) {
case _DocumentSelectionState() when $default != null:
return $default(_that.selected,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentSelectionState implements DocumentSelectionState {
  const _DocumentSelectionState({this.selected = DocumentType.nin, this.status = FormStatus.initial});
  

@override@JsonKey() final  DocumentType selected;
@override@JsonKey() final  FormStatus status;

/// Create a copy of DocumentSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentSelectionStateCopyWith<_DocumentSelectionState> get copyWith => __$DocumentSelectionStateCopyWithImpl<_DocumentSelectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentSelectionState&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,selected,status);

@override
String toString() {
  return 'DocumentSelectionState(selected: $selected, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DocumentSelectionStateCopyWith<$Res> implements $DocumentSelectionStateCopyWith<$Res> {
  factory _$DocumentSelectionStateCopyWith(_DocumentSelectionState value, $Res Function(_DocumentSelectionState) _then) = __$DocumentSelectionStateCopyWithImpl;
@override @useResult
$Res call({
 DocumentType selected, FormStatus status
});




}
/// @nodoc
class __$DocumentSelectionStateCopyWithImpl<$Res>
    implements _$DocumentSelectionStateCopyWith<$Res> {
  __$DocumentSelectionStateCopyWithImpl(this._self, this._then);

  final _DocumentSelectionState _self;
  final $Res Function(_DocumentSelectionState) _then;

/// Create a copy of DocumentSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selected = null,Object? status = null,}) {
  return _then(_DocumentSelectionState(
selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as DocumentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormStatus,
  ));
}


}

// dart format on
