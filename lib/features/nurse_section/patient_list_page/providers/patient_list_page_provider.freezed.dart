// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_list_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PatientListPageState {

 AsyncValue<List<PatientEntity>> get patients; String get searchQuery;
/// Create a copy of PatientListPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientListPageStateCopyWith<PatientListPageState> get copyWith => _$PatientListPageStateCopyWithImpl<PatientListPageState>(this as PatientListPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientListPageState&&(identical(other.patients, patients) || other.patients == patients)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,patients,searchQuery);

@override
String toString() {
  return 'PatientListPageState(patients: $patients, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class $PatientListPageStateCopyWith<$Res>  {
  factory $PatientListPageStateCopyWith(PatientListPageState value, $Res Function(PatientListPageState) _then) = _$PatientListPageStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<List<PatientEntity>> patients, String searchQuery
});




}
/// @nodoc
class _$PatientListPageStateCopyWithImpl<$Res>
    implements $PatientListPageStateCopyWith<$Res> {
  _$PatientListPageStateCopyWithImpl(this._self, this._then);

  final PatientListPageState _self;
  final $Res Function(PatientListPageState) _then;

/// Create a copy of PatientListPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? patients = null,Object? searchQuery = null,}) {
  return _then(_self.copyWith(
patients: null == patients ? _self.patients : patients // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<PatientEntity>>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _PatientListPageState implements PatientListPageState {
   _PatientListPageState({this.patients = const AsyncValue.loading(), this.searchQuery = ''});
  

@override@JsonKey() final  AsyncValue<List<PatientEntity>> patients;
@override@JsonKey() final  String searchQuery;

/// Create a copy of PatientListPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientListPageStateCopyWith<_PatientListPageState> get copyWith => __$PatientListPageStateCopyWithImpl<_PatientListPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientListPageState&&(identical(other.patients, patients) || other.patients == patients)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,patients,searchQuery);

@override
String toString() {
  return 'PatientListPageState(patients: $patients, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$PatientListPageStateCopyWith<$Res> implements $PatientListPageStateCopyWith<$Res> {
  factory _$PatientListPageStateCopyWith(_PatientListPageState value, $Res Function(_PatientListPageState) _then) = __$PatientListPageStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<List<PatientEntity>> patients, String searchQuery
});




}
/// @nodoc
class __$PatientListPageStateCopyWithImpl<$Res>
    implements _$PatientListPageStateCopyWith<$Res> {
  __$PatientListPageStateCopyWithImpl(this._self, this._then);

  final _PatientListPageState _self;
  final $Res Function(_PatientListPageState) _then;

/// Create a copy of PatientListPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? patients = null,Object? searchQuery = null,}) {
  return _then(_PatientListPageState(
patients: null == patients ? _self.patients : patients // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<PatientEntity>>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
