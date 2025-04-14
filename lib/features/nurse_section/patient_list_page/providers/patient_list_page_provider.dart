import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_entity.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_location_status.dart';

part 'patient_list_page_provider.freezed.dart';

@freezed
abstract class PatientListPageState with _$PatientListPageState {
  factory PatientListPageState({
    @Default(AsyncValue.loading()) AsyncValue<List<PatientEntity>> patients,
    @Default('') String searchQuery,
  }) = _PatientListPageState;
}

final patientListPageProvider =
    StateNotifierProvider<PatientListPageNotifier, PatientListPageState>(
      PatientListPageNotifier.new,
    );

class PatientListPageNotifier extends StateNotifier<PatientListPageState> {
  PatientListPageNotifier(this.ref) : super(PatientListPageState()) {
    _loadPatients();
  }

  final Ref ref;

  void _loadPatients() {
    // V reálné aplikaci by zde byl API call pro načtení pacientů
    // Pro účely ukázky používáme dummy data
    final dummyPatients = <PatientEntity>[
      const PatientEntity(
        id: '1',
        firstName: 'Jan',
        lastName: 'Novák',
        birthDate: '15.6.1975',
        insuranceNumber: '7506151234',

        gender: PatientGender.male,
        lastVisit: '10.5.2023',
        locationStatus: PatientLocationStatus.waitingRoom,
        nextAppointment: '15.6.2023',
        notes: 'Pacient po operaci, pravidelné kontroly každé 3 měsíce.',
      ),
      const PatientEntity(
        id: '2',
        firstName: 'Marie',
        lastName: 'Svobodová',
        birthDate: '22.3.1982',
        insuranceNumber: '8253221234',
        gender: PatientGender.female,
        lastVisit: '5.5.2023',
        locationStatus: PatientLocationStatus.consultation,
        nextAppointment: '5.8.2023',
        notes: 'Hypertenze, pravidelné kontroly každé 3 měsíce.',
      ),
      const PatientEntity(
        id: '3',
        firstName: 'Petr',
        lastName: 'Černý',
        birthDate: '10.11.1990',
        insuranceNumber: '9011101234',
        gender: PatientGender.male,
        lastVisit: '20.4.2023',
        locationStatus: PatientLocationStatus.injection,
        nextAppointment: '20.7.2023',
        notes: 'Migrény, pravidelné kontroly každé 3 měsíce.',
      ),
      const PatientEntity(
        id: '4',
        firstName: 'Eva',
        lastName: 'Nováková',
        birthDate: '5.7.2010',
        insuranceNumber: '1007051234',
        gender: PatientGender.female,
        lastVisit: '15.5.2023',
        locationStatus: PatientLocationStatus.uptakeBox1,
        nextAppointment: '15.8.2023',
        notes: 'Pravidelná preventivní prohlídka.',
      ),
      const PatientEntity(
        id: '5',
        firstName: 'Jiří',
        lastName: 'Dvořák',
        birthDate: '30.12.1965',
        insuranceNumber: '6512301234',
        gender: PatientGender.male,
        lastVisit: '25.5.2023',
        locationStatus: PatientLocationStatus.uptakeBox2,
        nextAppointment: null,
        notes: 'Jednorázová konzultace.',
      ),
      const PatientEntity(
        id: '6',
        firstName: 'Lucie',
        lastName: 'Procházková',
        birthDate: '18.9.1988',
        insuranceNumber: '8809181234',
        gender: PatientGender.female,
        lastVisit: '12.5.2023',
        locationStatus: PatientLocationStatus.uptakeWaitingRoom,
        nextAppointment: '12.8.2023',
        notes: 'Pacientka po chemoterapii, pravidelné kontroly každé 3 měsíce.',
      ),
      const PatientEntity(
        id: '7',
        firstName: 'Tomáš',
        lastName: 'Veselý',
        birthDate: '7.4.1970',
        insuranceNumber: '7004071234',
        gender: PatientGender.male,
        lastVisit: '8.5.2023',
        locationStatus: PatientLocationStatus.petScan,
        nextAppointment: '8.8.2023',
        notes: 'Arytmie, pravidelné kontroly každé 3 měsíce.',
      ),
      const PatientEntity(
        id: '8',
        firstName: 'Kateřina',
        lastName: 'Marková',
        birthDate: '25.5.1995',
        insuranceNumber: '9505251234',
        gender: PatientGender.female,
        lastVisit: '18.5.2023',
        locationStatus: PatientLocationStatus.dischargeBox1,
        nextAppointment: '18.8.2023',
        notes: 'Epilepsie, pravidelné kontroly každé 3 měsíce.',
      ),
      const PatientEntity(
        id: '9',
        firstName: 'Jakub',
        lastName: 'Kučera',
        birthDate: '14.2.2015',
        insuranceNumber: '1502141234',
        gender: PatientGender.male,
        lastVisit: '22.5.2023',
        locationStatus: PatientLocationStatus.dischargeBox2,
        nextAppointment: '22.8.2023',
        notes: 'Pravidelná preventivní prohlídka.',
      ),
      const PatientEntity(
        id: '10',
        firstName: 'Zuzana',
        lastName: 'Králová',
        birthDate: '9.8.1980',
        insuranceNumber: '8008091234',
        gender: PatientGender.female,
        lastVisit: '28.5.2023',
        locationStatus: PatientLocationStatus.leftFacility,
        nextAppointment: null,
        notes: 'Jednorázová konzultace.',
      ),
    ];

    state = state.copyWith(patients: AsyncValue.data(dummyPatients));
  }

  /// Nastaví vyhledávací dotaz
  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  /// Vrátí filtrovaný seznam pacientů podle vyhledávacího dotazu
  List<PatientEntity> getFilteredPatients() {
    final patients = state.patients.value ?? [];
    final query = state.searchQuery.toLowerCase();

    return patients.where((patient) {
      // Filtrování pouze podle vyhledávacího dotazu
      if (query.isEmpty) {
        return true;
      }

      return patient.firstName.toLowerCase().contains(query) ||
          patient.lastName.toLowerCase().contains(query) ||
          patient.insuranceNumber.contains(query);
    }).toList();
  }

  /// Updates the location status of a patient
  void updatePatientLocationStatus(
    String patientId,
    PatientLocationStatus newStatus,
  ) {
    final patients = state.patients.value ?? [];
    final updatedPatients =
        patients.map((patient) {
          if (patient.id == patientId) {
            // Create a new patient with the updated location status
            return PatientEntity(
              id: patient.id,
              firstName: patient.firstName,
              lastName: patient.lastName,
              birthDate: patient.birthDate,
              insuranceNumber: patient.insuranceNumber,
              gender: patient.gender,
              lastVisit: patient.lastVisit,
              nextAppointment: patient.nextAppointment,
              notes: patient.notes,
              locationStatus: newStatus,
            );
          }
          return patient;
        }).toList();

    state = state.copyWith(patients: AsyncValue.data(updatedPatients));
  }
}
