import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/examination_detail_page/entities/examination_detail_entity.dart';
import 'package:nuke_nanny/features/examination_detail_page/entities/examination_status_entity.dart';

/// Komponenta pro zobrazení akčních tlačítek na stránce detailu vyšetření
class ActionButtons extends StatelessWidget {
  /// Vytvoří novou instanci [ActionButtons]
  const ActionButtons({
    super.key,
    required this.examination,
    this.onReschedule,
    this.onCancel,
    this.onContact,
  });

  /// Detail vyšetření
  final ExaminationDetailEntity examination;

  /// Callback pro přeplánování vyšetření
  final VoidCallback? onReschedule;

  /// Callback pro zrušení vyšetření
  final VoidCallback? onCancel;

  /// Callback pro kontaktování lékaře
  final VoidCallback? onContact;

  @override
  Widget build(BuildContext context) {
    // Zobrazíme různá tlačítka podle stavu vyšetření
    if (examination.status == ExaminationStatusEntity.completed ||
        examination.status == ExaminationStatusEntity.cancelled) {
      return _buildCompletedButtons();
      // } else if (examination.status == ExaminationStatusEntity.waitingForResults) {
      //   return _buildWaitingForResultsButtons();
    } else {
      return _buildPlannedButtons();
    }
  }

  Widget _buildPlannedButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: Icons.calendar_month,
            label: 'Přeplánovat',
            color: Styles.appColors.info,
            onPressed: onReschedule,
          ),
        ),
        Expanded(
          child: _buildActionButton(
            icon: Icons.phone,
            label: 'Kontaktovat',
            color: Styles.appColors.primary,
            onPressed: onContact,
          ),
        ),
        Expanded(
          child: _buildActionButton(
            icon: Icons.cancel,
            label: 'Zrušit',
            color: Styles.appColors.error,
            onPressed: onCancel,
          ),
        ),
      ],
    );
  }

  // Widget _buildWaitingForResultsButtons() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       _buildActionButton(
  //         icon: Icons.phone,
  //         label: 'Kontaktovat',
  //         color: Styles.appColors.primary,
  //         onPressed: onContact,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildCompletedButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            icon: Icons.description,
            label: 'Výsledky',
            color: Styles.appColors.success,
            onPressed: () {},
          ),
        ),
        Expanded(
          child: _buildActionButton(
            icon: Icons.phone,
            label: 'Kontaktovat',
            color: Styles.appColors.primary,
            onPressed: onContact,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: Styles.borderRadiuses.button,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icon, color: color, size: 24)),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Styles.textStyles.body2.copyWith(
                color: Styles.appColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
