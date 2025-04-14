// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'examination_list_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExaminationListPageState {

 AsyncValue<String> get userName; AsyncValue<List<ExaminationEntity>> get content;
/// Create a copy of ExaminationListPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExaminationListPageStateCopyWith<ExaminationListPageState> get copyWith => _$ExaminationListPageStateCopyWithImpl<ExaminationListPageState>(this as ExaminationListPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExaminationListPageState&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,userName,content);

@override
String toString() {
  return 'ExaminationListPageState(userName: $userName, content: $content)';
}


}

/// @nodoc
abstract mixin class $ExaminationListPageStateCopyWith<$Res>  {
  factory $ExaminationListPageStateCopyWith(ExaminationListPageState value, $Res Function(ExaminationListPageState) _then) = _$ExaminationListPageStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<String> userName, AsyncValue<List<ExaminationEntity>> content
});




}
/// @nodoc
class _$ExaminationListPageStateCopyWithImpl<$Res>
    implements $ExaminationListPageStateCopyWith<$Res> {
  _$ExaminationListPageStateCopyWithImpl(this._self, this._then);

  final ExaminationListPageState _self;
  final $Res Function(ExaminationListPageState) _then;

/// Create a copy of ExaminationListPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? content = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as AsyncValue<String>,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<ExaminationEntity>>,
  ));
}

}


/// @nodoc


class _ExaminationListPageState implements ExaminationListPageState {
   _ExaminationListPageState({this.userName = const AsyncValue.loading(), this.content = const AsyncValue.loading()});
  

@override@JsonKey() final  AsyncValue<String> userName;
@override@JsonKey() final  AsyncValue<List<ExaminationEntity>> content;

/// Create a copy of ExaminationListPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExaminationListPageStateCopyWith<_ExaminationListPageState> get copyWith => __$ExaminationListPageStateCopyWithImpl<_ExaminationListPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExaminationListPageState&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,userName,content);

@override
String toString() {
  return 'ExaminationListPageState(userName: $userName, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ExaminationListPageStateCopyWith<$Res> implements $ExaminationListPageStateCopyWith<$Res> {
  factory _$ExaminationListPageStateCopyWith(_ExaminationListPageState value, $Res Function(_ExaminationListPageState) _then) = __$ExaminationListPageStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<String> userName, AsyncValue<List<ExaminationEntity>> content
});




}
/// @nodoc
class __$ExaminationListPageStateCopyWithImpl<$Res>
    implements _$ExaminationListPageStateCopyWith<$Res> {
  __$ExaminationListPageStateCopyWithImpl(this._self, this._then);

  final _ExaminationListPageState _self;
  final $Res Function(_ExaminationListPageState) _then;

/// Create a copy of ExaminationListPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? content = null,}) {
  return _then(_ExaminationListPageState(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as AsyncValue<String>,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<ExaminationEntity>>,
  ));
}


}

// dart format on
