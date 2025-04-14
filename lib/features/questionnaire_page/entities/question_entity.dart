/// A model representing a question in a questionnaire.
class QuestionEntity {
  /// Creates a [QuestionEntity].
  QuestionEntity({
    required this.id,
    required this.text,
    required this.options,
    this.selectedOption,
  });

  /// Unique identifier for the question.
  final String id;

  /// The text of the question.
  final String text;

  /// The available options for the question.
  final List<String> options;

  /// The currently selected option, if any.
  final String? selectedOption;

  /// Creates a copy of this question with the given fields replaced with the new values.
  QuestionEntity copyWith({
    String? id,
    String? text,
    List<String>? options,
    String? selectedOption,
  }) {
    return QuestionEntity(
      id: id ?? this.id,
      text: text ?? this.text,
      options: options ?? this.options,
      selectedOption: selectedOption,
    );
  }
}
