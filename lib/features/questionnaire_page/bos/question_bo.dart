import 'package:json_annotation/json_annotation.dart';

part 'question_bo.g.dart';

@JsonSerializable()
class QuestionBO {
  QuestionBO({required this.id, required this.text, required this.options});

  factory QuestionBO.fromJson(Map<String, dynamic> json) =>
      _$QuestionBOFromJson(json);

  final String id;
  final String text;
  final List<String> options;

  Map<String, dynamic> toJson() => _$QuestionBOToJson(this);
}
