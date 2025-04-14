import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';

/// A reusable scaffold for medical application screens.
///
/// This scaffold provides a consistent look and feel across the application,
/// with a light, calming design suitable for oncology patients.
class MedicalScaffold extends StatelessWidget {
  /// Creates a [MedicalScaffold].
  const MedicalScaffold({
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
                  )
                  : null,
          color: backgroundColor,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(context),
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
}
