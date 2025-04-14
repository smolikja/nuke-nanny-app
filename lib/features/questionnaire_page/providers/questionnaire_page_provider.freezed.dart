// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionnairePageState {

 AsyncValue<List<QuestionEntity>> get questions; int get currentPage;
/// Create a copy of QuestionnairePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionnairePageStateCopyWith<QuestionnairePageState> get copyWith => _$QuestionnairePageStateCopyWithImpl<QuestionnairePageState>(this as QuestionnairePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionnairePageState&&(identical(other.questions, questions) || other.questions == questions)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,questions,currentPage);

@override
String toString() {
  return 'QuestionnairePageState(questions: $questions, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $QuestionnairePageStateCopyWith<$Res>  {
  factory $QuestionnairePageStateCopyWith(QuestionnairePageState value, $Res Function(QuestionnairePageState) _then) = _$QuestionnairePageStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<List<QuestionEntity>> questions, int currentPage
});




}
/// @nodoc
class _$QuestionnairePageStateCopyWithImpl<$Res>
    implements $QuestionnairePageStateCopyWith<$Res> {
  _$QuestionnairePageStateCopyWithImpl(this._self, this._then);

  final QuestionnairePageState _self;
  final $Res Function(QuestionnairePageState) _then;

/// Create a copy of QuestionnairePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questions = null,Object? currentPage = null,}) {
  return _then(_self.copyWith(
questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<QuestionEntity>>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _QuestionnairePageState implements QuestionnairePageState {
   _QuestionnairePageState({this.questions = const AsyncValue.loading(), this.currentPage = 0});
  

@override@JsonKey() final  AsyncValue<List<QuestionEntity>> questions;
@override@JsonKey() final  int currentPage;

/// Create a copy of QuestionnairePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionnairePageStateCopyWith<_QuestionnairePageState> get copyWith => __$QuestionnairePageStateCopyWithImpl<_QuestionnairePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionnairePageState&&(identical(other.questions, questions) || other.questions == questions)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,questions,currentPage);

@override
String toString() {
  return 'QuestionnairePageState(questions: $questions, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$QuestionnairePageStateCopyWith<$Res> implements $QuestionnairePageStateCopyWith<$Res> {
  factory _$QuestionnairePageStateCopyWith(_QuestionnairePageState value, $Res Function(_QuestionnairePageState) _then) = __$QuestionnairePageStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<List<QuestionEntity>> questions, int currentPage
});




}
/// @nodoc
class __$QuestionnairePageStateCopyWithImpl<$Res>
    implements _$QuestionnairePageStateCopyWith<$Res> {
  __$QuestionnairePageStateCopyWithImpl(this._self, this._then);

  final _QuestionnairePageState _self;
  final $Res Function(_QuestionnairePageState) _then;

/// Create a copy of QuestionnairePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? currentPage = null,}) {
  return _then(_QuestionnairePageState(
questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<QuestionEntity>>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
