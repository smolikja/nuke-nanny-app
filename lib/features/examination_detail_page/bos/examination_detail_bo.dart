import 'package:json_annotation/json_annotation.dart';
import 'package:nuke_nanny/features/examination_detail_page/bos/examination_detail_status.dart';

part 'examination_detail_bo.g.dart';

@JsonSerializable()
class ExaminationDetailBO {
  ExaminationDetailBO({
    required this.examinationId,
    required this.doctorName,
    required this.timestamp,
    required this.status,
    required this.instructions,
  });
  factory ExaminationDetailBO.fromJson(Map<String, dynamic> json) =>
      _$ExaminationDetailBOFromJson(json);

  final String examinationId;
  final String doctorName;
  final int timestamp;
  final ExaminationDetailStatus status;
  final List<String> instructions;

  Map<String, dynamic> toJson() => _$ExaminationDetailBOToJson(this);
}
