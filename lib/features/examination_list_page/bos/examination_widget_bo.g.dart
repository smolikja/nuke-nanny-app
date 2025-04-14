// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_widget_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExaminationWidgetBO _$ExaminationWidgetBOFromJson(Map<String, dynamic> json) =>
    ExaminationWidgetBO(
      examinationWidgetId: json['examinationWidgetId'] as String,
      doctorName: json['doctorName'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      status: $enumDecode(_$ExaminationWidgetStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ExaminationWidgetBOToJson(
  ExaminationWidgetBO instance,
) => <String, dynamic>{
  'examinationWidgetId': instance.examinationWidgetId,
  'doctorName': instance.doctorName,
  'timestamp': instance.timestamp,
  'status': _$ExaminationWidgetStatusEnumMap[instance.status]!,
};

const _$ExaminationWidgetStatusEnumMap = {
  ExaminationWidgetStatus.planned: 'planned',
  ExaminationWidgetStatus.completed: 'completed',
  ExaminationWidgetStatus.proposed: 'proposed',
  ExaminationWidgetStatus.cancelled: 'cancelled',
};
