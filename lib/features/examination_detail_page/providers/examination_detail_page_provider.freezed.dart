// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'examination_detail_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExaminationDetailPageState {

 AsyncValue<ExaminationDetailEntity> get examination;
/// Create a copy of ExaminationDetailPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExaminationDetailPageStateCopyWith<ExaminationDetailPageState> get copyWith => _$ExaminationDetailPageStateCopyWithImpl<ExaminationDetailPageState>(this as ExaminationDetailPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExaminationDetailPageState&&(identical(other.examination, examination) || other.examination == examination));
}


@override
int get hashCode => Object.hash(runtimeType,examination);

@override
String toString() {
  return 'ExaminationDetailPageState(examination: $examination)';
}


}

/// @nodoc
abstract mixin class $ExaminationDetailPageStateCopyWith<$Res>  {
  factory $ExaminationDetailPageStateCopyWith(ExaminationDetailPageState value, $Res Function(ExaminationDetailPageState) _then) = _$ExaminationDetailPageStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<ExaminationDetailEntity> examination
});




}
/// @nodoc
class _$ExaminationDetailPageStateCopyWithImpl<$Res>
    implements $ExaminationDetailPageStateCopyWith<$Res> {
  _$ExaminationDetailPageStateCopyWithImpl(this._self, this._then);

  final ExaminationDetailPageState _self;
  final $Res Function(ExaminationDetailPageState) _then;

/// Create a copy of ExaminationDetailPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? examination = null,}) {
  return _then(_self.copyWith(
examination: null == examination ? _self.examination : examination // ignore: cast_nullable_to_non_nullable
as AsyncValue<ExaminationDetailEntity>,
  ));
}

}


/// @nodoc


class _ExaminationDetailPageState implements ExaminationDetailPageState {
   _ExaminationDetailPageState({this.examination = const AsyncValue.loading()});
  

@override@JsonKey() final  AsyncValue<ExaminationDetailEntity> examination;

/// Create a copy of ExaminationDetailPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExaminationDetailPageStateCopyWith<_ExaminationDetailPageState> get copyWith => __$ExaminationDetailPageStateCopyWithImpl<_ExaminationDetailPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExaminationDetailPageState&&(identical(other.examination, examination) || other.examination == examination));
}


@override
int get hashCode => Object.hash(runtimeType,examination);

@override
String toString() {
  return 'ExaminationDetailPageState(examination: $examination)';
}


}

/// @nodoc
abstract mixin class _$ExaminationDetailPageStateCopyWith<$Res> implements $ExaminationDetailPageStateCopyWith<$Res> {
  factory _$ExaminationDetailPageStateCopyWith(_ExaminationDetailPageState value, $Res Function(_ExaminationDetailPageState) _then) = __$ExaminationDetailPageStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<ExaminationDetailEntity> examination
});




}
/// @nodoc
class __$ExaminationDetailPageStateCopyWithImpl<$Res>
    implements _$ExaminationDetailPageStateCopyWith<$Res> {
  __$ExaminationDetailPageStateCopyWithImpl(this._self, this._then);

  final _ExaminationDetailPageState _self;
  final $Res Function(_ExaminationDetailPageState) _then;

/// Create a copy of ExaminationDetailPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? examination = null,}) {
  return _then(_ExaminationDetailPageState(
examination: null == examination ? _self.examination : examination // ignore: cast_nullable_to_non_nullable
as AsyncValue<ExaminationDetailEntity>,
  ));
}


}

// dart format on
