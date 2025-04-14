import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuke_nanny/features/examination_list_page/providers/examination_list_page_provider.dart';
import 'package:nuke_nanny/features/questionnaire_page/components/action_button.dart';
import 'package:nuke_nanny/features/questionnaire_page/components/page_indicator.dart';
import 'package:nuke_nanny/features/questionnaire_page/components/question_card.dart';
import 'package:nuke_nanny/features/questionnaire_page/providers/questionnaire_page_provider.dart';

class QuestionnairePageContent extends ConsumerStatefulWidget {
  const QuestionnairePageContent({super.key});

  @override
  ConsumerState<QuestionnairePageContent> createState() =>
      _QuestionnairePageContentState();
}

class _QuestionnairePageContentState
    extends ConsumerState<QuestionnairePageContent> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    final questions = ref.read(questionnairePageProvider).questions.value ?? [];
    final currentPage = ref.read(questionnairePageProvider).currentPage;
    if (currentPage < questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _exitQuestionnaire() {
    Navigator.of(context).pop();
  }

  void _signIn(WidgetRef ref) {
    // Implement signIn logic here
    showCupertinoDialog(
      context: context,
      builder:
          (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Úspěch'),
            content: const Text('Přihlášení na termín bylo úspěšné'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop(); // Zavře dialog
                  ref.read(examinationListPageProvider.notifier).fakeUpdate();
                  Navigator.of(
                    context,
                  ).pop(); // Vrátí se na předchozí obrazovku
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questions =
        ref.watch(questionnairePageProvider).questions.value ?? [];
    final currentPage = ref.watch(questionnairePageProvider).currentPage;
    final isLastPage = currentPage == questions.length - 1;

    // Check if the current question has a selected option
    final hasSelectedOption =
        questions.isNotEmpty &&
        currentPage < questions.length &&
        questions[currentPage].selectedOption != null;

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: questions.length,
            onPageChanged:
                ref.read(questionnairePageProvider.notifier).changePage,
            itemBuilder: (context, index) {
              return QuestionCard(
                question: questions[index],
                onOptionSelected:
                    (option) => ref
                        .read(questionnairePageProvider.notifier)
                        .changeOption(index, option),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: PageIndicator(
            count: questions.length,
            currentIndex: currentPage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionButton(
                text: 'Ukončit',
                onPressed: _exitQuestionnaire,
                type: ActionButtonType.secondary,
                icon: Icons.close,
              ),
              ActionButton(
                text: isLastPage ? 'Přihlásit' : 'Další',
                onPressed: isLastPage ? () => _signIn(ref) : _nextPage,
                icon: isLastPage ? Icons.login : Icons.arrow_forward,
                isEnabled: hasSelectedOption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
