import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_location_status.dart';

/// Pohlaví pacienta
enum PatientGender {
  /// Muž
  male,

  /// Žena
  female,
}

/// Entita reprezentující pacienta
class PatientEntity extends Equatable {
  /// Vytvoří novou instanci [PatientEntity]
  const PatientEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.insuranceNumber,
    required this.gender,
    required this.lastVisit,
    required this.locationStatus,
    required this.nextAppointment,
    this.notes,
  });

  /// Unikátní identifikátor pacienta
  final String id;

  /// Jméno pacienta
  final String firstName;

  /// Příjmení pacienta
  final String lastName;

  /// Datum narození
  final String birthDate;

  /// Číslo pojištěnce
  final String insuranceNumber;

  /// Pohlaví pacienta
  final PatientGender gender;

  /// Datum poslední návštěvy
  final String lastVisit;

  /// Patient location status
  final PatientLocationStatus locationStatus;

  /// Datum příští návštěvy
  final String? nextAppointment;

  /// Poznámky k pacientovi
  final String? notes;

  /// Celé jméno pacienta
  String get fullName => '$firstName $lastName';

  /// Ikona pacienta podle pohlaví
  IconData get genderIcon =>
      gender == PatientGender.male ? Icons.man : Icons.woman;

  /// Barva ikony pacienta
  Color get genderColor =>
      gender == PatientGender.male ? Colors.blue : Colors.pink;

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    birthDate,
    insuranceNumber,
    gender,
    lastVisit,
    nextAppointment,
    notes,
  ];
}
