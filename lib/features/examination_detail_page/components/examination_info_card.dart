import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/components/medical_card.dart';
import 'package:nuke_nanny/core/components/medical_card_status_bar.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/examination_detail_page/entities/examination_detail_entity.dart';

/// Komponenta pro zobrazení základních informací o vyšetření
class ExaminationInfoCard extends StatelessWidget {
  /// Vytvoří novou instanci [ExaminationInfoCard]
  const ExaminationInfoCard({super.key, required this.examination});

  /// Detail vyšetření k zobrazení
  final ExaminationDetailEntity examination;

  @override
  Widget build(BuildContext context) {
    return MedicalCard(
      statusBar: MedicalCardStatusBar(
        text: examination.statusText,
        color: examination.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: examination.color.withValues(alpha: 0.1),
                  borderRadius: Styles.borderRadiuses.button,
                ),
                child: Icon(
                  examination.icon,
                  color: examination.color,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  examination.title,
                  style: Styles.textStyles.h5.copyWith(
                    color: Styles.appColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildInfoRow(Icons.person, 'Lékař', examination.doctor),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.phone, 'Kontakt', examination.doctorContact),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.calendar_today, 'Datum', examination.date),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.access_time, 'Čas', examination.time),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Styles.appColors.textTertiary, size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Styles.textStyles.body2.copyWith(
                color: Styles.appColors.textTertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: Styles.textStyles.body1.copyWith(
                color: Styles.appColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
