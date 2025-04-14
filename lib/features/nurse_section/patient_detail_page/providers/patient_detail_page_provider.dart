import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuke_nanny/features/nurse_section/patient_detail_page/entities/patient_detail_entity.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_entity.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_location_status.dart';

part 'patient_detail_page_provider.freezed.dart';

@freezed
abstract class PatientDetailPageState with _$PatientDetailPageState {
  factory PatientDetailPageState({
    @Default(AsyncValue.loading()) AsyncValue<PatientDetailEntity> patient,
  }) = _PatientDetailPageState;
}

final patientDetailPageProvider = StateNotifierProvider.family<
  PatientDetailPageNotifier,
  PatientDetailPageState,
  String
>(PatientDetailPageNotifier.new);

class PatientDetailPageNotifier extends StateNotifier<PatientDetailPageState> {
  PatientDetailPageNotifier(this.ref, this.patientId)
    : super(PatientDetailPageState()) {
    _loadPatientDetail();
  }

  final Ref ref;
  final String patientId;

  Future<void> _loadPatientDetail() async {
    // In a real app, this would be an API call to fetch patient details
    // For demonstration purposes, we'll simulate a network delay and use mock data
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock data for the patient detail
    final patientDetail = _getMockPatientDetail(patientId);

    state = state.copyWith(patient: AsyncValue.data(patientDetail));
  }

  /// Updates the location status of the patient
  void updatePatientLocationStatus(PatientLocationStatus newStatus) {
    final currentPatient = state.patient.value;
    if (currentPatient == null) return;

    final updatedPatient = currentPatient.copyWith(locationStatus: newStatus);
    state = state.copyWith(patient: AsyncValue.data(updatedPatient));
  }

  /// Mock data for patient detail
  PatientDetailEntity _getMockPatientDetail(String patientId) {
    // In a real app, this would fetch data from an API
    // For demonstration purposes, we'll use hardcoded data
    switch (patientId) {
      case '1':
        return const PatientDetailEntity(
          id: '1',
          firstName: 'Jan',
          lastName: 'Novák',
          birthDate: '15.6.1975',
          insuranceNumber: '7506151234',
          gender: PatientGender.male,
          locationStatus: PatientLocationStatus.waitingRoom,
          lastVisit: '10.5.2023',
          nextAppointment: '15.6.2023',
          notes: 'Pacient po operaci, pravidelné kontroly každé 3 měsíce.',
          medicalHistory: 'Appendectomy (2010), Hypertension (2015)',
          allergies: ['Penicillin', 'Pollen'],
          medications: ['Enalapril 10mg', 'Aspirin 100mg'],
          contactPhone: '+420 123 456 789',
          contactEmail: 'jan.novak@example.com',
          emergencyContact: 'Marie Nováková (manželka) +420 987 654 321',
        );
      case '2':
        return const PatientDetailEntity(
          id: '2',
          firstName: 'Marie',
          lastName: 'Svobodová',
          birthDate: '22.3.1982',
          insuranceNumber: '8253221234',
          gender: PatientGender.female,
          locationStatus: PatientLocationStatus.consultation,
          lastVisit: '5.5.2023',
          nextAppointment: '5.8.2023',
          notes: 'Hypertenze, pravidelné kontroly každé 3 měsíce.',
          medicalHistory: 'Hypertension (2018), Cholecystectomy (2019)',
          allergies: ['Sulfonamides'],
          medications: ['Metoprolol 50mg', 'Hydrochlorothiazide 25mg'],
          contactPhone: '+420 234 567 890',
          contactEmail: 'marie.svobodova@example.com',
          emergencyContact: 'Petr Svoboda (manžel) +420 876 543 210',
        );
      default:
        // For any other ID, create a generic patient detail
        return PatientDetailEntity(
          id: patientId,
          firstName: 'Neznámý',
          lastName: 'Pacient',
          birthDate: '01.01.1990',
          insuranceNumber: '9001011234',
          gender: PatientGender.male,
          locationStatus: PatientLocationStatus.reception,
          lastVisit: '01.01.2023',
          nextAppointment: null,
          notes: 'Žádné poznámky k dispozici.',
          medicalHistory: 'Žádná lékařská historie k dispozici.',
          allergies: [],
          medications: [],
          contactPhone: 'Neznámý',
          contactEmail: 'Neznámý',
          emergencyContact: 'Neznámý',
        );
    }
  }
}
