// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionBO _$QuestionBOFromJson(Map<String, dynamic> json) => QuestionBO(
  id: json['id'] as String,
  text: json['text'] as String,
  options: (json['options'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$QuestionBOToJson(QuestionBO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'options': instance.options,
    };
