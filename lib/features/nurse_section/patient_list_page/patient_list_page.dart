import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuke_nanny/core/components/medical_page.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/patient_list_page_content.dart';

/// Stránka seznamu pacientů pro zdravotní sestry
class PatientListPage extends ConsumerWidget {
  const PatientListPage({
    super.key,
    required this.onExaminationListTap,
    required this.onPatientDetailTap,
  });

  /// Vytvoří novou instanci [PatientListPage]

  final VoidCallback onExaminationListTap;
  final Function(String) onPatientDetailTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MedicalPage(
      title: 'Seznam pacientů',
      showBackButton: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onExaminationListTap,
        ),
      ],
      body: PatientListPageContent(onPatientTap: onPatientDetailTap),
    );
  }
}
