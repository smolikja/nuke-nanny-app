import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/components/medical_card.dart';
import 'package:nuke_nanny/core/components/medical_card_status_bar.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/examination_list_page/entities/examination_entity.dart';

class ExaminationListPageContent extends StatelessWidget {
  const ExaminationListPageContent({
    super.key,
    required this.data,
    required this.onExaminationSignTap,
    required this.onExaminationDetailTap,
  });

  final List<ExaminationEntity> data;
  final VoidCallback onExaminationSignTap;
  final VoidCallback onExaminationDetailTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final examination = data[index];
          return ExaminationCard(
            examination: examination,
            onExaminationSignTap: onExaminationSignTap,
            onExaminationDetailTap: onExaminationDetailTap,
          );
        },
      ),
    );
  }
}

class ExaminationCard extends StatelessWidget {
  const ExaminationCard({
    super.key,
    required this.examination,
    required this.onExaminationSignTap,
    required this.onExaminationDetailTap,
  });

  final ExaminationEntity examination;
  final VoidCallback onExaminationSignTap;
  final VoidCallback onExaminationDetailTap;

  void _handleReject(BuildContext context) {
    // Zobrazíme dialog pro zrušení
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Odmítnout vyšetření'),
            content: const Text('Opravdu chcete odmítnout toto vyšetření?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ne'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Zde by byla implementace zrušení vyšetření
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vyšetření bylo odmítnuto')),
                  );
                },
                child: const Text('Ano, odmítnout'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onExaminationDetailTap,
      child: MedicalCard(
        statusBar: MedicalCardStatusBar(
          text: examination.statusText,
          color: examination.color,
          status: examination.status,
          onAccept: onExaminationSignTap,
          onReject: () => _handleReject(context),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: examination.color.withValues(alpha: 0.1),
                borderRadius: Styles.borderRadiuses.button,
              ),
              child: Icon(examination.icon, color: examination.color, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    examination.title,
                    style: Styles.textStyles.title1.copyWith(
                      color: Styles.appColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    examination.doctor,
                    style: Styles.textStyles.body2.copyWith(
                      color: Styles.appColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Styles.appColors.textTertiary,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        examination.date,
                        style: Styles.textStyles.body2.copyWith(
                          color: Styles.appColors.textTertiary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.access_time,
                        color: Styles.appColors.textTertiary,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        examination.time,
                        style: Styles.textStyles.body2.copyWith(
                          color: Styles.appColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
