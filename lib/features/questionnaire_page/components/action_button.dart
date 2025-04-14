import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';

/// Button types for the action button.
enum ActionButtonType {
  /// Primary button with filled background.
  primary,

  /// Secondary button with outlined style.
  secondary,
}

/// A button component for actions in the questionnaire.
class ActionButton extends StatelessWidget {
  /// Creates an [ActionButton].
  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ActionButtonType.primary,
    this.icon,
    this.isEnabled = true,
  });

  /// The text to display on the button.
  final String text;

  /// Callback for when the button is pressed.
  final VoidCallback onPressed;

  /// The type of the button.
  final ActionButtonType type;

  /// Optional icon to display before the text.
  final IconData? icon;

  /// Whether the button is enabled.
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final isPrimary = type == ActionButtonType.primary;

    // Calculate colors based on enabled state
    final backgroundColor =
        isPrimary
            ? isEnabled
                ? Styles.appColors.primary
                : Styles.appColors.primary.withValues(alpha: 0.5)
            : Colors.transparent;

    final borderColor =
        isEnabled
            ? Styles.appColors.primary
            : Styles.appColors.primary.withValues(alpha: 0.5);

    final textAndIconColor =
        isPrimary
            ? Styles.appColors.onPrimary
            : isEnabled
            ? Styles.appColors.primary
            : Styles.appColors.primary.withValues(alpha: 0.5);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: Styles.borderRadiuses.button,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: Styles.borderRadiuses.button,
            border:
                isPrimary ? null : Border.all(color: borderColor, width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: textAndIconColor),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: Styles.textStyles.body1.copyWith(
                  color: textAndIconColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
