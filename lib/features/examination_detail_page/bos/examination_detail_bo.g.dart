// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_detail_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExaminationDetailBO _$ExaminationDetailBOFromJson(Map<String, dynamic> json) =>
    ExaminationDetailBO(
      examinationId: json['examinationId'] as String,
      doctorName: json['doctorName'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      status: $enumDecode(_$ExaminationDetailStatusEnumMap, json['status']),
      instructions:
          (json['instructions'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$ExaminationDetailBOToJson(
  ExaminationDetailBO instance,
) => <String, dynamic>{
  'examinationId': instance.examinationId,
  'doctorName': instance.doctorName,
  'timestamp': instance.timestamp,
  'status': _$ExaminationDetailStatusEnumMap[instance.status]!,
  'instructions': instance.instructions,
};

const _$ExaminationDetailStatusEnumMap = {
  ExaminationDetailStatus.planned: 'planned',
  ExaminationDetailStatus.completed: 'completed',
  ExaminationDetailStatus.proposed: 'proposed',
  ExaminationDetailStatus.cancelled: 'cancelled',
};
