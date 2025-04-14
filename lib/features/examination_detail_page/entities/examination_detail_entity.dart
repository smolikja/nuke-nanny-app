import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/examination_detail_page/entities/examination_status_entity.dart';

/// Entita reprezentující detail vyšetření
class ExaminationDetailEntity extends Equatable {
  /// Vytvoří novou instanci [ExaminationDetailEntity]
  const ExaminationDetailEntity({
    required this.title,
    required this.doctor,
    required this.doctorContact,
    required this.date,
    required this.time,
    required this.status,
    required this.instructions,
    required this.icon,
  });

  /// Název vyšetření
  final String title;

  /// Jméno vyšetřujícího lékaře
  final String doctor;

  /// Kontakt na lékaře
  final String doctorContact;

  /// Datum vyšetření
  final String date;

  /// Čas vyšetření
  final String time;

  /// Status vyšetření
  final ExaminationStatusEntity status;

  /// Instrukce k vyšetření
  final List<String> instructions;

  /// Ikona reprezentující typ vyšetření
  final IconData icon;

  @override
  List<Object?> get props => [
    title,
    doctor,
    doctorContact,
    date,
    time,
    status,
    statusText,
    instructions,
    icon,
    color,
  ];

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
}
