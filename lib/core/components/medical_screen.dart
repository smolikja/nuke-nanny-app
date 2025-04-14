import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';

/// A reusable screen component for medical application screens.
///
/// This component provides a consistent look and feel across the application,
/// with a light, calming design suitable for oncology patients.
/// It extends the functionality of MedicalScaffold by providing additional
/// features specific to medical screens.
class MedicalScreen extends StatelessWidget {
  /// Creates a [MedicalScreen].
  const MedicalScreen({
    super.key,
    required this.title,
    required this.body,
    this.header,
    this.actions,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.showBackButton = false,
    this.onBackPressed,
    this.backgroundColor,
    this.greetingText,
    this.userName,
  });

  /// The title displayed in the app bar.
  final String title;

  /// The main content of the screen.
  final Widget body;

  /// Optional widget to display at the top of the screen, below the app bar.
  final Widget? header;

  /// Optional action buttons to display in the app bar.
  final List<Widget>? actions;

  /// Optional bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  /// Whether to show a back button in the app bar.
  final bool showBackButton;

  /// Callback for when the back button is pressed.
  final VoidCallback? onBackPressed;

  /// Background color for the scaffold. If null, uses a default light gradient.
  final Color? backgroundColor;

  /// Optional greeting text to display in the header.
  final String? greetingText;

  /// Optional user name to display in the header.
  final String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:
              backgroundColor == null
                  ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Styles.appColors.gradientStart,
                      Styles.appColors.gradientMiddle,
                      Styles.appColors.gradientEnd,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  )
                  : null,
          color: backgroundColor,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(context),
              if (greetingText != null || userName != null) _buildGreeting(),
              if (header != null) header!,
              Expanded(child: body),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (showBackButton)
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
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Styles.appColors.primary,
                      size: 20,
                    ),
                    onPressed:
                        onBackPressed ?? () => Navigator.of(context).pop(),
                  ),
                ),
              if (showBackButton) const SizedBox(width: 16),
              Text(
                title,
                style: Styles.textStyles.h4.copyWith(
                  color: Styles.appColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(children: actions ?? []),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (greetingText != null)
            Row(
              children: [
                Text(
                  greetingText!,
                  style: Styles.textStyles.h5.copyWith(
                    color: Styles.appColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(' 🙏', style: TextStyle(fontSize: 20)),
              ],
            ),
          if (greetingText != null && userName != null)
            const SizedBox(height: 4),
          if (userName != null)
            Text(
              userName!,
              style: Styles.textStyles.h3.copyWith(
                color: Styles.appColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
