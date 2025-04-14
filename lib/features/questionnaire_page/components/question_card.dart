import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/components/medical_card.dart';
import 'package:nuke_nanny/core/styles/styles.dart';
import 'package:nuke_nanny/features/questionnaire_page/entities/question_entity.dart';

/// A card component for displaying a question and its options.
class QuestionCard extends StatelessWidget {
  /// Creates a [QuestionCard].
  const QuestionCard({
    super.key,
    required this.question,
    required this.onOptionSelected,
  });

  /// The question to display.
  final QuestionEntity question;

  /// Callback for when an option is selected.
  final Function(String) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    return MedicalCard(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.text,
            style: Styles.textStyles.h5.copyWith(
              color: Styles.appColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24.0),
          ...question.options.map(_buildOptionItem),
        ],
      ),
    );
  }

  Widget _buildOptionItem(String option) {
    final isSelected = option == question.selectedOption;

    return GestureDetector(
      onTap: () => onOptionSelected(option),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Styles.appColors.primary.withValues(alpha: 0.1)
                  : Styles.appColors.surface,
          borderRadius: Styles.borderRadiuses.button,
          border: Border.all(
            color:
                isSelected
                    ? Styles.appColors.primary
                    : Styles.appColors.textTertiary.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isSelected
                        ? Styles.appColors.primary
                        : Styles.appColors.surface,
                border: Border.all(
                  color:
                      isSelected
                          ? Styles.appColors.primary
                          : Styles.appColors.textTertiary,
                  width: 1.5,
                ),
              ),
              child:
                  isSelected
                      ? Icon(
                        Icons.check,
                        size: 16,
                        color: Styles.appColors.onPrimary,
                      )
                      : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                option,
                style: Styles.textStyles.body1.copyWith(
                  color: Styles.appColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
