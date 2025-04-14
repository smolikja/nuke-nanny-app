import 'package:json_annotation/json_annotation.dart';
import 'package:nuke_nanny/features/questionnaire_page/bos/question_bo.dart';

part 'examination_questions_bo.g.dart';

@JsonSerializable()
class ExaminationQuestionsBO {
  ExaminationQuestionsBO({
    required this.examinationId,
    required this.questions,
  });

  factory ExaminationQuestionsBO.fromJson(Map<String, dynamic> json) =>
      _$ExaminationQuestionsBOFromJson(json);

  final String examinationId;
  final List<QuestionBO> questions;

  Map<String, dynamic> toJson() => _$ExaminationQuestionsBOToJson(this);
}
