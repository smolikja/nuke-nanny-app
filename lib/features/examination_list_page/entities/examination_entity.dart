import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/examination_list_page/entities/examination_status_entity.dart';

class ExaminationEntity extends Equatable {
  const ExaminationEntity({
    required this.title,
    required this.doctor,
    required this.date,
    required this.time,
    required this.status,
    required this.icon,
  });
  final String title;
  final String doctor;
  final String date;
  final String time;
  final ExaminationStatusEntity status;
  final IconData icon;

  Color get color => switch (status) {
    ExaminationStatusEntity.planned => Styles.appColors.info,
    ExaminationStatusEntity.completed => Styles.appColors.warning,
    ExaminationStatusEntity.proposed => Styles.appColors.success,
    ExaminationStatusEntity.cancelled => Styles.appColors.error,
  };

  String get statusText => switch (status) {
    ExaminationStatusEntity.planned => 'Naplánováno',
    ExaminationStatusEntity.completed => 'Proběhlé',
    ExaminationStatusEntity.proposed => 'Navrhované',
    ExaminationStatusEntity.cancelled => 'Zrušeno',
  };

  @override
  List<Object?> get props => [title, doctor, date, time, status, icon, color];
}
