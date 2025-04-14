import 'package:flutter/material.dart';

abstract class AppColorsScheme {
  // Brand colors
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;

  // Status colors
  Color get error;
  Color get onError;
  Color get success;
  Color get onSuccess;
  Color get warning;
  Color get onWarning;
  Color get info;
  Color get onInfo;
  Color get special;
  Color get onSpecial;

  // Background colors
  Color get background;
  Color get surface;
  Color get cardBackground;

  // Gradient colors
  Color get gradientStart;
  Color get gradientMiddle;
  Color get gradientEnd;

  // Text colors
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;

  // Shadow colors
  Color get shadow;
}
