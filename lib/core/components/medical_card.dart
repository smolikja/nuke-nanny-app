import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/styles.dart';

/// A reusable card component for displaying medical information.
///
/// This card provides a consistent look and feel across the application,
/// with a light, calming design suitable for oncology patients.
class MedicalCard extends StatelessWidget {
  /// Creates a [MedicalCard].
  const MedicalCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.only(bottom: 16.0),
    this.statusBar,
  });

  /// The main content of the card.
  final Widget child;

  /// Optional color for the card background.
  final Color? backgroundColor;

  /// Optional border radius for the card.
  final BorderRadius? borderRadius;

  /// Optional elevation for the card.
  final double elevation;

  /// Optional padding for the card content.
  final EdgeInsetsGeometry padding;

  /// Optional margin for the card.
  final EdgeInsetsGeometry margin;

  /// Optional status bar at the bottom of the card.
  final Widget? statusBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        elevation: elevation,
        borderRadius: borderRadius ?? Styles.borderRadiuses.card,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: borderRadius ?? Styles.borderRadiuses.card,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? Styles.appColors.cardBackground,
              borderRadius: borderRadius ?? Styles.borderRadiuses.card,
              boxShadow: [
                BoxShadow(
                  color: Styles.appColors.shadow,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: padding, child: child),
                if (statusBar != null) statusBar!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
