// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_questions_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExaminationQuestionsBO _$ExaminationQuestionsBOFromJson(
  Map<String, dynamic> json,
) => ExaminationQuestionsBO(
  examinationId: json['examinationId'] as String,
  questions:
      (json['questions'] as List<dynamic>)
          .map((e) => QuestionBO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ExaminationQuestionsBOToJson(
  ExaminationQuestionsBO instance,
) => <String, dynamic>{
  'examinationId': instance.examinationId,
  'questions': instance.questions,
};
