import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/colors/app_colors_scheme.dart';

class AppColorsDark extends AppColorsScheme {
  // Brand colors
  @override
  Color get primary => const Color(0xFF255C83);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get secondary => const Color(0xFFD1750A);

  @override
  Color get onSecondary => const Color(0xFFFFFFFF);

  // Status colors
  @override
  Color get error => const Color(0xFFEE5521); // Red

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get success => const Color(0xFF477F42); // Green

  @override
  Color get onSuccess => const Color(0xFFFFFFFF);

  @override
  Color get warning => const Color(0xFFF59E0B); // Orange

  @override
  Color get onWarning => const Color(0xFFFFFFFF);

  @override
  Color get info => const Color(0xFF3B82F6); // Blue

  @override
  Color get onInfo => const Color(0xFFFFFFFF);

  @override
  Color get special => const Color(0xFF8B5CF6); // Purple

  @override
  Color get onSpecial => const Color(0xFFFFFFFF);

  // Background colors
  @override
  Color get background => const Color(0xFFF8F9FA);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get cardBackground => const Color(0xFFFFFFFF);

  // Gradient colors
  @override
  Color get gradientStart => const Color(0xFFF0F8FF); // Very light blue

  @override
  Color get gradientMiddle => const Color(0xFFE6F3FF); // Light blue

  @override
  Color get gradientEnd => const Color(0xFFE1F5FE); // Light blue with a hint of cyan

  // Text colors
  @override
  Color get textPrimary => const Color(0xFF2D3748); // Dark slate gray

  @override
  Color get textSecondary => const Color(0xFF4A5568); // Slate gray

  @override
  Color get textTertiary => const Color(0xFF718096); // Medium slate gray

  // Shadow colors
  @override
  Color get shadow => Colors.black.withValues(alpha: 0.05);
}
