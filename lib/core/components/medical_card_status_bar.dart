import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/components/medical_card.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/examination_list_page/entities/examination_status_entity.dart';

/// Status bar pro spodní část [MedicalCard].
///
/// Pokud je status typu [ExaminationStatusEntity.proposed], zobrazí se dvě tlačítka
/// pro potvrzení nebo zrušení vyšetření.
class MedicalCardStatusBar extends StatelessWidget {
  /// Creates a [MedicalCardStatusBar].
  const MedicalCardStatusBar({
    super.key,
    required this.text,
    required this.color,
    this.textColor,
    this.status,
    this.onAccept,
    this.onReject,
  });

  /// The text to display in the status bar.
  final String text;

  /// The color of the status bar.
  final Color color;

  /// The text color for the status bar.
  final Color? textColor;

  /// The status of the examination (optional).
  final Object? status;

  /// Callback for when the user accepts the proposed examination.
  final VoidCallback? onAccept;

  /// Callback for when the user rejects the proposed examination.
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    // Pokud je status "proposed", zobrazíme dvě tlačítka
    if (status is ExaminationStatusEntity &&
        status == ExaminationStatusEntity.proposed) {
      return _buildProposedStatusBar();
    }

    // Jinak zobrazíme standardní status bar
    return _buildStandardStatusBar();
  }

  Widget _buildStandardStatusBar() {
    return Container(
      width: double.infinity,
      height: 48, // Fixní výška pro konzistenci
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: Styles.borderRadiuses.cardStatusBar,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.textStyles.title2.copyWith(
            color: textColor ?? color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProposedStatusBar() {
    return Row(
      children: [
        // Tlačítko pro zrušení (červené)
        Expanded(
          child: InkWell(
            onTap: onReject,
            child: Container(
              height: 48, // Fixní výška pro konzistenci
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Styles.appColors.error.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  'Zrušit',
                  textAlign: TextAlign.center,
                  style: Styles.textStyles.title2.copyWith(
                    color: Styles.appColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Tlačítko pro potvrzení (zelené)
        Expanded(
          child: InkWell(
            onTap: onAccept,
            child: Container(
              height: 48, // Fixní výška pro konzistenci
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Styles.appColors.success.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  'Potvrdit',
                  textAlign: TextAlign.center,
                  style: Styles.textStyles.title2.copyWith(
                    color: Styles.appColors.success,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
