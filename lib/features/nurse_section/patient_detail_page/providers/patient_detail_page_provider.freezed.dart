// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_detail_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatientDetailPageState {

 AsyncValue<PatientDetailEntity> get patient;
/// Create a copy of PatientDetailPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientDetailPageStateCopyWith<PatientDetailPageState> get copyWith => _$PatientDetailPageStateCopyWithImpl<PatientDetailPageState>(this as PatientDetailPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientDetailPageState&&(identical(other.patient, patient) || other.patient == patient));
}


@override
int get hashCode => Object.hash(runtimeType,patient);

@override
String toString() {
  return 'PatientDetailPageState(patient: $patient)';
}


}

/// @nodoc
abstract mixin class $PatientDetailPageStateCopyWith<$Res>  {
  factory $PatientDetailPageStateCopyWith(PatientDetailPageState value, $Res Function(PatientDetailPageState) _then) = _$PatientDetailPageStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<PatientDetailEntity> patient
});




}
/// @nodoc
class _$PatientDetailPageStateCopyWithImpl<$Res>
    implements $PatientDetailPageStateCopyWith<$Res> {
  _$PatientDetailPageStateCopyWithImpl(this._self, this._then);

  final PatientDetailPageState _self;
  final $Res Function(PatientDetailPageState) _then;

/// Create a copy of PatientDetailPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patient = null,}) {
  return _then(_self.copyWith(
patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as AsyncValue<PatientDetailEntity>,
  ));
}

}


/// @nodoc


class _PatientDetailPageState implements PatientDetailPageState {
   _PatientDetailPageState({this.patient = const AsyncValue.loading()});
  

@override@JsonKey() final  AsyncValue<PatientDetailEntity> patient;

/// Create a copy of PatientDetailPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientDetailPageStateCopyWith<_PatientDetailPageState> get copyWith => __$PatientDetailPageStateCopyWithImpl<_PatientDetailPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientDetailPageState&&(identical(other.patient, patient) || other.patient == patient));
}


@override
int get hashCode => Object.hash(runtimeType,patient);

@override
String toString() {
  return 'PatientDetailPageState(patient: $patient)';
}


}

/// @nodoc
abstract mixin class _$PatientDetailPageStateCopyWith<$Res> implements $PatientDetailPageStateCopyWith<$Res> {
  factory _$PatientDetailPageStateCopyWith(_PatientDetailPageState value, $Res Function(_PatientDetailPageState) _then) = __$PatientDetailPageStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<PatientDetailEntity> patient
});




}
/// @nodoc
class __$PatientDetailPageStateCopyWithImpl<$Res>
    implements _$PatientDetailPageStateCopyWith<$Res> {
  __$PatientDetailPageStateCopyWithImpl(this._self, this._then);

  final _PatientDetailPageState _self;
  final $Res Function(_PatientDetailPageState) _then;

/// Create a copy of PatientDetailPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patient = null,}) {
  return _then(_PatientDetailPageState(
patient: null == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as AsyncValue<PatientDetailEntity>,
  ));
}


}

// dart format on
