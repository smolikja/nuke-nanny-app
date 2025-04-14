// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_widget_list_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExaminationWidgetListBO _$ExaminationWidgetListBOFromJson(
  Map<String, dynamic> json,
) => ExaminationWidgetListBO(
  userId: json['userId'] as String,
  examinationWidgets:
      (json['examinationWidgets'] as List<dynamic>)
          .map((e) => ExaminationWidgetBO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ExaminationWidgetListBOToJson(
  ExaminationWidgetListBO instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'examinationWidgets': instance.examinationWidgets,
};
