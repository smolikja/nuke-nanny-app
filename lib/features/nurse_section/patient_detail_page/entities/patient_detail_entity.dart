import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_entity.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_location_status.dart';

/// Entity representing detailed patient information
class PatientDetailEntity extends Equatable {
  /// Creates a new instance of [PatientDetailEntity]
  const PatientDetailEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.insuranceNumber,
    required this.gender,
    required this.locationStatus,
    required this.lastVisit,
    this.nextAppointment,
    this.notes,
    this.medicalHistory,
    this.allergies,
    this.medications,
    this.contactPhone,
    this.contactEmail,
    this.emergencyContact,
  });

  /// Creates a [PatientDetailEntity] from a [PatientEntity]
  factory PatientDetailEntity.fromPatientEntity(PatientEntity patient) {
    return PatientDetailEntity(
      id: patient.id,
      firstName: patient.firstName,
      lastName: patient.lastName,
      birthDate: patient.birthDate,
      insuranceNumber: patient.insuranceNumber,
      gender: patient.gender,
      locationStatus: patient.locationStatus,
      lastVisit: patient.lastVisit,
      nextAppointment: patient.nextAppointment,
      notes: patient.notes,
      // Additional fields are null by default
      medicalHistory: null,
      allergies: null,
      medications: null,
      contactPhone: null,
      contactEmail: null,
      emergencyContact: null,
    );
  }

  /// Unique patient identifier
  final String id;

  /// Patient's first name
  final String firstName;

  /// Patient's last name
  final String lastName;

  /// Date of birth
  final String birthDate;

  /// Insurance number
  final String insuranceNumber;

  /// Patient gender
  final PatientGender gender;

  /// Patient location status
  final PatientLocationStatus locationStatus;

  /// Date of last visit
  final String lastVisit;

  /// Date of next appointment
  final String? nextAppointment;

  /// Patient notes
  final String? notes;

  /// Patient medical history
  final String? medicalHistory;

  /// Patient allergies
  final List<String>? allergies;

  /// Patient medications
  final List<String>? medications;

  /// Patient contact phone
  final String? contactPhone;

  /// Patient contact email
  final String? contactEmail;

  /// Patient emergency contact
  final String? emergencyContact;

  /// Full patient name
  String get fullName => '$firstName $lastName';

  /// Patient gender icon
  IconData get genderIcon =>
      gender == PatientGender.male ? Icons.man : Icons.woman;

  /// Patient gender color
  Color get genderColor =>
      gender == PatientGender.male ? Colors.blue : Colors.pink;

  /// Creates a copy of this entity with the given fields replaced
  PatientDetailEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? birthDate,
    String? insuranceNumber,
    PatientGender? gender,
    PatientLocationStatus? locationStatus,
    String? lastVisit,
    String? nextAppointment,
    String? notes,
    String? medicalHistory,
    List<String>? allergies,
    List<String>? medications,
    String? contactPhone,
    String? contactEmail,
    String? emergencyContact,
  }) {
    return PatientDetailEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      insuranceNumber: insuranceNumber ?? this.insuranceNumber,
      gender: gender ?? this.gender,
      locationStatus: locationStatus ?? this.locationStatus,
      lastVisit: lastVisit ?? this.lastVisit,
      nextAppointment: nextAppointment ?? this.nextAppointment,
      notes: notes ?? this.notes,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      allergies: allergies ?? this.allergies,
      medications: medications ?? this.medications,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
      emergencyContact: emergencyContact ?? this.emergencyContact,
    );
  }

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    birthDate,
    insuranceNumber,
    gender,
    locationStatus,
    lastVisit,
    nextAppointment,
    notes,
    medicalHistory,
    allergies,
    medications,
    contactPhone,
    contactEmail,
    emergencyContact,
  ];
}
