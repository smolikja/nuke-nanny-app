import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuke_nanny/core/components/medical_page.dart';
import 'package:nuke_nanny/core/components/platform_loading_indicator.dart';
import 'package:nuke_nanny/features/examination_detail_page/components/action_buttons.dart';
import 'package:nuke_nanny/features/examination_detail_page/components/examination_info_card.dart';
import 'package:nuke_nanny/features/examination_detail_page/components/instructions_card.dart';
import 'package:nuke_nanny/features/examination_detail_page/entities/examination_detail_entity.dart';
import 'package:nuke_nanny/features/examination_detail_page/providers/examination_detail_page_provider.dart';

/// Obrazovka zobrazující detail vyšetření
class ExaminationDetailPage extends ConsumerWidget {
  /// Vytvoří novou instanci [ExaminationDetailPage]
  const ExaminationDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examinationState =
        ref.watch(examinationDetailPageProvider).examination;

    return examinationState.when(
      data: (examination) => _buildContent(context, examination),
      loading: () => const Center(child: PlatformLoadingIndicator(size: 30)),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ExaminationDetailEntity examination,
  ) {
    return MedicalPage(
      title: 'Detail vyšetření',
      showBackButton: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExaminationInfoCard(examination: examination),
            const SizedBox(height: 16),
            ActionButtons(
              examination: examination,
              onReschedule: () => _showRescheduleDialog(context),
              onCancel: () => _showCancelDialog(context),
              onContact: () => _contactDoctor(context, examination),
            ),
            const SizedBox(height: 24),
            InstructionsCard(instructions: examination.instructions),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showRescheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Přeplánovat vyšetření'),
            content: const Text(
              'Opravdu chcete přeplánovat toto vyšetření? '
              'Budete přesměrováni na výběr nového termínu.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Zrušit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Implementace přeplánování
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Přeplánování vyšetření...')),
                  );
                },
                child: const Text('Přeplánovat'),
              ),
            ],
          ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Zrušit vyšetření'),
            content: const Text(
              'Opravdu chcete zrušit toto vyšetření? '
              'Tato akce je nevratná.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ne'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Implementace zrušení
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vyšetření bylo zrušeno')),
                  );
                },
                child: const Text('Ano, zrušit'),
              ),
            ],
          ),
    );
  }

  void _contactDoctor(
    BuildContext context,
    ExaminationDetailEntity examination,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Kontaktovat lékaře'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lékař: ${examination.doctor}'),
                const SizedBox(height: 8),
                Text('Kontakt: ${examination.doctorContact}'),
                const SizedBox(height: 16),
                const Text('Vyberte způsob kontaktu:'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Zrušit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Implementace telefonátu
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Volání lékaři...')),
                  );
                },
                child: const Text('Zavolat'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Implementace SMS
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Odesílání SMS...')),
                  );
                },
                child: const Text('Poslat SMS'),
              ),
            ],
          ),
    );
  }
}
