import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:nuke_nanny/features/questionnaire_page/entities/question_entity.dart';

part 'questionnaire_page_provider.freezed.dart';

@freezed
abstract class QuestionnairePageState with _$QuestionnairePageState {
  factory QuestionnairePageState({
    @Default(AsyncValue.loading()) AsyncValue<List<QuestionEntity>> questions,
    @Default(0) int currentPage,
  }) = _QuestionnairePageState;
}

final questionnairePageProvider = StateNotifierProvider.autoDispose<
  QuestionnairePageNotifier,
  QuestionnairePageState
>(QuestionnairePageNotifier.new);

class QuestionnairePageNotifier extends StateNotifier<QuestionnairePageState> {
  QuestionnairePageNotifier(this.ref) : super(QuestionnairePageState()) {
    _setQuestions();
  }

  final _logger = Logger('QuestionnairePageNotifier');
  final Ref ref;

  void _setQuestions() {
    final questions = <QuestionEntity>[
      QuestionEntity(
        id: '1',
        text: 'Jak často navštěvujete lékaře?',
        options: [
          'Méně než jednou ročně',
          'Jednou ročně',
          'Dvakrát ročně',
          'Více než dvakrát ročně',
        ],
        selectedOption: null,
      ),
      QuestionEntity(
        id: '2',
        text: 'Máte nějaké chronické onemocnění?',
        options: ['Ano', 'Ne', 'Nejsem si jistý/á'],
        selectedOption: null,
      ),
      QuestionEntity(
        id: '3',
        text: 'Užíváte pravidelně nějaké léky?',
        options: ['Ano, každý den', 'Ano, občas', 'Ne, neužívám'],
        selectedOption: null,
      ),
    ];

    state = state.copyWith(questions: AsyncValue.data(questions));
  }

  void changePage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void changeOption(int questionIndex, String option) {
    final questions = state.questions.value ?? [];
    final updatedQuestions =
        questions.map((question) {
          if (question.id == questions[questionIndex].id) {
            return question.copyWith(selectedOption: option);
          }
          return question;
        }).toList();

    state = state.copyWith(questions: AsyncValue.data(updatedQuestions));
  }
}
