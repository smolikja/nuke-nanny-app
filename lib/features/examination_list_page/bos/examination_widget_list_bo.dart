import 'package:json_annotation/json_annotation.dart';
import 'package:nuke_nanny/features/examination_list_page/bos/examination_widget_bo.dart';

part 'examination_widget_list_bo.g.dart';

@JsonSerializable()
class ExaminationWidgetListBO {
  ExaminationWidgetListBO({
    required this.userId,
    required this.examinationWidgets,
  });

  factory ExaminationWidgetListBO.fromJson(Map<String, dynamic> json) =>
      _$ExaminationWidgetListBOFromJson(json);

  final String userId;
  final List<ExaminationWidgetBO> examinationWidgets;

  Map<String, dynamic> toJson() => _$ExaminationWidgetListBOToJson(this);
}
