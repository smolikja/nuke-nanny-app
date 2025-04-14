import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuke_nanny/core/components/medical_page.dart';
import 'package:nuke_nanny/core/components/platform_loading_indicator.dart';
import 'package:nuke_nanny/features/questionnaire_page/providers/questionnaire_page_provider.dart';
import 'package:nuke_nanny/features/questionnaire_page/questionnaire_page_content.dart';

class QuestionnairePage extends ConsumerWidget {
  const QuestionnairePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsState = ref.watch(questionnairePageProvider).questions;

    Widget widget() {
      return const MedicalPage(
        title: 'Dotazník',
        showBackButton: true,
        body: QuestionnairePageContent(),
      );
    }

    return questionsState.when(
      data: (questions) => widget(),
      loading: () => const Center(child: PlatformLoadingIndicator(size: 30)),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}
