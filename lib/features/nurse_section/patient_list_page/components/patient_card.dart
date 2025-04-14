import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/components/medical_card.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_entity.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/entities/patient_location_status.dart';

/// Patient card component
class PatientCard extends StatelessWidget {
  /// Creates a new instance of [PatientCard]
  const PatientCard({
    super.key,
    required this.patient,
    required this.onTap,
    required this.onLocationStatusChanged,
  });

  /// Patient to display
  final PatientEntity patient;

  /// Callback for card tap
  final VoidCallback onTap;

  /// Callback for location status change
  final Function(PatientLocationStatus) onLocationStatusChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MedicalCard(
        child: Row(
          children: [
            _buildCategoryIndicator(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPatientInfo(),
                  const SizedBox(height: 8),
                  _buildAppointmentInfo(),
                  const SizedBox(height: 8),
                  _buildLocationStatus(),
                ],
              ),
            ),
            _buildArrow(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIndicator() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: patient.genderColor.withValues(alpha: 0.1),
        borderRadius: Styles.borderRadiuses.button,
      ),
      child: Icon(patient.genderIcon, color: patient.genderColor, size: 30),
    );
  }

  Widget _buildPatientInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                patient.fullName,
                style: Styles.textStyles.title1.copyWith(
                  color: Styles.appColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            SizedBox(
              width: 20,
              child: Icon(
                Icons.calendar_today,
                color: Styles.appColors.textTertiary,
                size: 14,
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 80,
              child: Text(
                patient.birthDate,
                style: Styles.textStyles.body2.copyWith(
                  color: Styles.appColors.textSecondary,
                ),
              ),
            ),
            SizedBox(
              width: 20,
              child: Icon(
                Icons.credit_card,
                color: Styles.appColors.textTertiary,
                size: 14,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              patient.insuranceNumber,
              style: Styles.textStyles.body2.copyWith(
                color: Styles.appColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAppointmentInfo() {
    return Row(
      children: [
        SizedBox(
          width: 20,
          child: Icon(
            Icons.history,
            color: Styles.appColors.textTertiary,
            size: 14,
          ),
        ),
        const SizedBox(width: 4),
        SizedBox(
          width: 80,
          child: Text(
            patient.lastVisit,
            style: Styles.textStyles.body2.copyWith(
              color: Styles.appColors.textTertiary,
            ),
          ),
        ),
        if (patient.nextAppointment != null) ...[
          SizedBox(
            width: 20,
            child: Icon(
              Icons.event,
              color: Styles.appColors.textTertiary,
              size: 14,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            patient.nextAppointment!,
            style: Styles.textStyles.body2.copyWith(
              color: Styles.appColors.textTertiary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildArrow() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Icon(
        Icons.arrow_forward_ios,
        color: Styles.appColors.textTertiary,
        size: 16,
      ),
    );
  }

  Widget _buildLocationStatus() {
    return Container(
      decoration: BoxDecoration(
        color: Styles.appColors.background.withValues(alpha: 0.7),
        borderRadius: Styles.borderRadiuses.small,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<PatientLocationStatus>(
          value: patient.locationStatus,
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
          onChanged: (PatientLocationStatus? newValue) {
            if (newValue != null) {
              onLocationStatusChanged(newValue);
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
    );
  }
}
