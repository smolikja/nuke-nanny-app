import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuke_nanny/core/components/medical_page.dart';
import 'package:nuke_nanny/core/components/platform_loading_indicator.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/examination_list_page/examination_list_page_content.dart';
import 'package:nuke_nanny/features/examination_list_page/providers/examination_list_page_provider.dart';

class ExaminationListPage extends ConsumerWidget {
  const ExaminationListPage({
    super.key,
    required this.onExaminationSignTap,
    required this.onExaminationDetailTap,
    required this.onPatienListTap,
  });

  final VoidCallback onExaminationSignTap;
  final VoidCallback onExaminationDetailTap;
  final VoidCallback onPatienListTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentState = ref.watch(examinationListPageProvider).content;
    final userNameState = ref.watch(examinationListPageProvider).userName;

    return MedicalPage(
      title: userNameState.value ?? '',
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Styles.appColors.surface,
            borderRadius: Styles.borderRadiuses.button,
            boxShadow: [
              BoxShadow(
                color: Styles.appColors.shadow,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.menu, color: Styles.appColors.primary),
            onPressed: onPatienListTap,
          ),
        ),
      ],
      body: contentState.when(
        data:
            (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    'Seznam vyšetření',
                    style: Styles.textStyles.h5.copyWith(
                      color: Styles.appColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ExaminationListPageContent(
                  data: data,
                  onExaminationSignTap: onExaminationSignTap,
                  onExaminationDetailTap: onExaminationDetailTap,
                ),
              ],
            ),
        loading: () => const Center(child: PlatformLoadingIndicator(size: 30)),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
      ),
    );
  }
}
