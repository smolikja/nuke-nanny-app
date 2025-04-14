import 'package:flutter/material.dart';

/// A class that provides border radiuses for the application.
///
/// This class centralizes all border radius definitions to ensure
/// consistent styling across the application.
class BorderRadiuses {
  // Card border radiuses
  /// Border radius for cards (16)
  final BorderRadius card = BorderRadius.circular(16);

  /// Border radius for the bottom of status bars
  final BorderRadius cardStatusBar = const BorderRadius.only(
    bottomLeft: Radius.circular(16),
    bottomRight: Radius.circular(16),
  );

  // Button and container border radiuses
  /// Border radius for buttons and small containers (12)
  final BorderRadius button = BorderRadius.circular(12);

  /// Border radius for small elements (8)
  final BorderRadius small = BorderRadius.circular(8);

  /// Border radius for extra small elements (4)
  final BorderRadius extraSmall = BorderRadius.circular(4);

  /// Border radius for circular elements
  final BorderRadius circular = BorderRadius.circular(100);
}
