import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuke_nanny/core/components/platform_loading_indicator.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/components/patient_card.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/components/search_bar.dart';
import 'package:nuke_nanny/features/nurse_section/patient_list_page/providers/patient_list_page_provider.dart';

/// Obsah stránky seznamu pacientů
class PatientListPageContent extends ConsumerWidget {
  /// Vytvoří novou instanci [PatientListPageContent]
  const PatientListPageContent({super.key, required this.onPatientTap});

  /// Callback pro kliknutí na pacienta
  final Function(String) onPatientTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientsState = ref.watch(patientListPageProvider).patients;
    final searchQuery = ref.watch(patientListPageProvider).searchQuery;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: PatientSearchBar(
            searchQuery: searchQuery,
            onSearchChanged:
                (query) => ref
                    .read(patientListPageProvider.notifier)
                    .setSearchQuery(query),
          ),
        ),

        Expanded(
          child: patientsState.when(
            data: (patients) {
              final filteredPatients =
                  ref
                      .read(patientListPageProvider.notifier)
                      .getFilteredPatients();

              if (filteredPatients.isEmpty) {
                return _buildEmptyState();
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredPatients.length,
                itemBuilder: (context, index) {
                  final patient = filteredPatients[index];
                  return PatientCard(
                    patient: patient,
                    onTap: () => onPatientTap(patient.id),
                    onLocationStatusChanged:
                        (newStatus) =>
                        // Update the patient's location status in the provider
                        ref
                            .read(patientListPageProvider.notifier)
                            .updatePatientLocationStatus(patient.id, newStatus),
                  );
                },
              );
            },
            loading:
                () => const Center(child: PlatformLoadingIndicator(size: 30)),
            error:
                (error, stackTrace) => Center(
                  child: Text(
                    'Chyba při načítání pacientů: $error',
                    style: Styles.textStyles.body1.copyWith(
                      color: Styles.appColors.error,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Styles.appColors.textTertiary,
          ),
          const SizedBox(height: 16),
          Text(
            'Žádní pacienti nenalezeni',
            style: Styles.textStyles.h5.copyWith(
              color: Styles.appColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Zkuste změnit vyhledávací dotaz nebo filtr kategorie',
            style: Styles.textStyles.body1.copyWith(
              color: Styles.appColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
