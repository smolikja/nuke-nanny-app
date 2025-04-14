import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuke_nanny/core/components/medical_card.dart';
import 'package:nuke_nanny/core/components/medical_page.dart';
import 'package:nuke_nanny/core/components/platform_loading_indicator.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/nurse_section/patient_detail_page/entities/patient_detail_entity.dart';
import 'package:nuke_nanny/features/nurse_section/patient_detail_page/providers/patient_detail_page_provider.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_location_status.dart';

/// Patient detail page for nurses
class PatientDetailPage extends ConsumerWidget {
  const PatientDetailPage({super.key, required this.patientId});

  /// Creates a new instance of [PatientDetailPage]

  /// The patient to display
  final String patientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientDetailState = ref.watch(patientDetailPageProvider(patientId));

    return MedicalPage(
      title: patientDetailState.patient.value?.fullName ?? '',
      showBackButton: true,
      body: patientDetailState.patient.when(
        data: (patientDetail) => _buildContent(context, ref, patientDetail),
        loading: () => const Center(child: PlatformLoadingIndicator(size: 30)),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    PatientDetailEntity patientDetail,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPatientInfoCard(context, patientDetail),
          const SizedBox(height: 16),
          _buildLocationStatusCard(context, ref, patientDetail),
          const SizedBox(height: 16),
          _buildAppointmentsCard(context, patientDetail),
          const SizedBox(height: 16),
          if (patientDetail.notes != null)
            _buildNotesCard(context, patientDetail),
          const SizedBox(height: 16),
          if (patientDetail.medicalHistory != null)
            _buildMedicalHistoryCard(context, patientDetail),
          const SizedBox(height: 16),
          if (patientDetail.allergies != null &&
              patientDetail.allergies!.isNotEmpty)
            _buildAllergiesCard(context, patientDetail),
          const SizedBox(height: 16),
          if (patientDetail.medications != null &&
              patientDetail.medications!.isNotEmpty)
            _buildMedicationsCard(context, patientDetail),
          const SizedBox(height: 16),
          _buildContactInfoCard(context, patientDetail),
        ],
      ),
    );
  }

  Widget _buildPatientInfoCard(
    BuildContext context,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Styles.appColors.background,
                  borderRadius: Styles.borderRadiuses.small,
                ),
                child: Icon(
                  patientDetail.genderIcon,
                  color: patientDetail.genderColor,
                  size: 40,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientDetail.fullName,
                      style: Styles.textStyles.title1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Datum narození: ${patientDetail.birthDate}',
                      style: Styles.textStyles.body2.copyWith(
                        color: Styles.appColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Číslo pojištěnce: ${patientDetail.insuranceNumber}',
                      style: Styles.textStyles.body2.copyWith(
                        color: Styles.appColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationStatusCard(
    BuildContext context,
    WidgetRef ref,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aktuální umístění',
            style: Styles.textStyles.title2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Styles.appColors.background.withValues(alpha: 0.7),
              borderRadius: Styles.borderRadiuses.small,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<PatientLocationStatus>(
                value: patientDetail.locationStatus,
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Styles.appColors.primary,
                  size: 20,
                ),
                elevation: 1,
                borderRadius: Styles.borderRadiuses.small,
                style: Styles.textStyles.body2.copyWith(
                  color: Styles.appColors.primary,
                  fontWeight: FontWeight.w500,
                ),
                dropdownColor: Styles.appColors.background,
                onChanged: (PatientLocationStatus? newStatus) {
                  if (newStatus != null) {
                    // Update the patient's location status in the provider
                    ref
                        .read(
                          patientDetailPageProvider(patientDetail.id).notifier,
                        )
                        .updatePatientLocationStatus(newStatus);

                    // Show a snackbar to confirm the change
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Umístění pacienta ${patientDetail.fullName} změněno na ${newStatus.title}',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                items:
                    PatientLocationStatus.values
                        .map<DropdownMenuItem<PatientLocationStatus>>((
                          PatientLocationStatus value,
                        ) {
                          return DropdownMenuItem<PatientLocationStatus>(
                            value: value,
                            child: Text(
                              value.title,
                              style: Styles.textStyles.body2.copyWith(
                                color: Styles.appColors.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        })
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentsCard(
    BuildContext context,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Návštěvy',
            style: Styles.textStyles.title2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildAppointmentItem(
            context,
            'Poslední návštěva',
            patientDetail.lastVisit,
            Icons.history,
          ),
          if (patientDetail.nextAppointment != null) ...[
            const SizedBox(height: 12),
            _buildAppointmentItem(
              context,
              'Příští návštěva',
              patientDetail.nextAppointment!,
              Icons.event,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAppointmentItem(
    BuildContext context,
    String title,
    String date,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Styles.appColors.primary.withValues(alpha: 0.1),
            borderRadius: Styles.borderRadiuses.small,
          ),
          child: Icon(icon, color: Styles.appColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.textStyles.body2.copyWith(
                color: Styles.appColors.textSecondary,
              ),
            ),
            Text(
              date,
              style: Styles.textStyles.body1.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotesCard(
    BuildContext context,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Poznámky',
            style: Styles.textStyles.title2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(patientDetail.notes!, style: Styles.textStyles.body1),
        ],
      ),
    );
  }

  Widget _buildMedicalHistoryCard(
    BuildContext context,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lékařská historie',
            style: Styles.textStyles.title2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(patientDetail.medicalHistory!, style: Styles.textStyles.body1),
        ],
      ),
    );
  }

  Widget _buildAllergiesCard(
    BuildContext context,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alergie',
            style: Styles.textStyles.title2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...patientDetail.allergies!.map(
            (allergy) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Styles.appColors.warning,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(allergy, style: Styles.textStyles.body1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationsCard(
    BuildContext context,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Léky',
            style: Styles.textStyles.title2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...patientDetail.medications!.map(
            (medication) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.medication_rounded,
                    color: Styles.appColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(medication, style: Styles.textStyles.body1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoCard(
    BuildContext context,
    PatientDetailEntity patientDetail,
  ) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kontaktní informace',
            style: Styles.textStyles.title2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (patientDetail.contactPhone != null)
            _buildContactItem(
              context,
              'Telefon',
              patientDetail.contactPhone!,
              Icons.phone,
            ),
          if (patientDetail.contactEmail != null) ...[
            const SizedBox(height: 12),
            _buildContactItem(
              context,
              'Email',
              patientDetail.contactEmail!,
              Icons.email,
            ),
          ],
          if (patientDetail.emergencyContact != null) ...[
            const SizedBox(height: 12),
            _buildContactItem(
              context,
              'Nouzový kontakt',
              patientDetail.emergencyContact!,
              Icons.emergency,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Styles.appColors.secondary.withValues(alpha: 0.1),
            borderRadius: Styles.borderRadiuses.small,
          ),
          child: Icon(icon, color: Styles.appColors.secondary, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.textStyles.body2.copyWith(
                  color: Styles.appColors.textSecondary,
                ),
              ),
              Text(
                value,
                style: Styles.textStyles.body1.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
