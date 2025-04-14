import 'package:json_annotation/json_annotation.dart';
import 'package:nuke_nanny/features/examination_list_page/bos/examination_widget_status.dart';

part 'examination_widget_bo.g.dart';

@JsonSerializable()
class ExaminationWidgetBO {
  ExaminationWidgetBO({
    required this.examinationWidgetId,
    required this.doctorName,
    required this.timestamp,
    required this.status,
  });
  factory ExaminationWidgetBO.fromJson(Map<String, dynamic> json) =>
      _$ExaminationWidgetBOFromJson(json);

  final String examinationWidgetId;
  final String doctorName;
  final int timestamp;
  final ExaminationWidgetStatus status;

  Map<String, dynamic> toJson() => _$ExaminationWidgetBOToJson(this);
}
