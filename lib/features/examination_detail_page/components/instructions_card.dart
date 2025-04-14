import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/components/medical_card.dart';
import 'package:nuke_nanny/core/styles/styles.dart';

/// Komponenta pro zobrazení instrukcí k vyšetření
class InstructionsCard extends StatelessWidget {
  /// Vytvoří novou instanci [InstructionsCard]
  const InstructionsCard({
    super.key,
    required this.instructions,
  });

  /// Seznam instrukcí k zobrazení
  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return MedicalCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Instrukce k vyšetření',
            style: Styles.textStyles.h5.copyWith(
              color: Styles.appColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...instructions.map(_buildInstructionItem),
        ],
      ),
    );
  }

  Widget _buildInstructionItem(String instruction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Styles.appColors.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              instruction,
              style: Styles.textStyles.body1.copyWith(
                color: Styles.appColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
