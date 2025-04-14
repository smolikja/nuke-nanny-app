import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';

/// Komponenta pro vyhledávací pole
class PatientSearchBar extends StatelessWidget {
  /// Vytvoří novou instanci [PatientSearchBar]
  const PatientSearchBar({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    this.hintText = 'Vyhledat pacienta...',
  });

  /// Aktuální vyhledávací dotaz
  final String searchQuery;

  /// Callback pro změnu vyhledávacího dotazu
  final ValueChanged<String> onSearchChanged;

  /// Text nápovědy
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Styles.appColors.background,
        borderRadius: Styles.borderRadiuses.button,
        boxShadow: [
          BoxShadow(
            color: Styles.appColors.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Styles.appColors.textTertiary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: TextEditingController(text: searchQuery)
                ..selection = TextSelection.fromPosition(
                  TextPosition(offset: searchQuery.length),
                ),
              onChanged: onSearchChanged,
              style: Styles.textStyles.body1.copyWith(
                color: Styles.appColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Styles.textStyles.body1.copyWith(
                  color: Styles.appColors.textTertiary,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (searchQuery.isNotEmpty)
            GestureDetector(
              onTap: () => onSearchChanged(''),
              child: Icon(
                Icons.close,
                color: Styles.appColors.textTertiary,
              ),
            ),
        ],
      ),
    );
  }
}
