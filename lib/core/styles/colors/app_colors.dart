import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/styles/colors/app_colors_dark.dart';
import 'package:nuke_nanny/core/styles/colors/app_colors_light.dart';
import 'package:nuke_nanny/core/styles/colors/app_colors_scheme.dart';

class AppColors implements AppColorsScheme {
  factory AppColors() {
    return _appColors;
  }
  AppColors._internal();
  static final AppColors _appColors = AppColors._internal();

  AppColorsScheme _currentScheme = AppColorsLight();

  // This method is never called in the app yet
  void setTheme(ThemeMode themeMode) {
    _currentScheme =
        themeMode == ThemeMode.dark ? AppColorsDark() : AppColorsLight();
  }

  // Brand colors
  @override
  Color get primary => _currentScheme.primary;

  @override
  Color get onPrimary => _currentScheme.onPrimary;

  @override
  Color get secondary => _currentScheme.secondary;

  @override
  Color get onSecondary => _currentScheme.onSecondary;

  // Status colors
  @override
  Color get error => _currentScheme.error;

  @override
  Color get onError => _currentScheme.onError;

  @override
  Color get success => _currentScheme.success;

  @override
  Color get onSuccess => _currentScheme.onSuccess;

  @override
  Color get warning => _currentScheme.warning;

  @override
  Color get onWarning => _currentScheme.onWarning;

  @override
  Color get info => _currentScheme.info;

  @override
  Color get onInfo => _currentScheme.onInfo;

  @override
  Color get special => _currentScheme.special;

  @override
  Color get onSpecial => _currentScheme.onSpecial;

  // Background colors
  @override
  Color get background => _currentScheme.background;

  @override
  Color get surface => _currentScheme.surface;

  @override
  Color get cardBackground => _currentScheme.cardBackground;

  // Gradient colors
  @override
  Color get gradientStart => _currentScheme.gradientStart;

  @override
  Color get gradientMiddle => _currentScheme.gradientMiddle;

  @override
  Color get gradientEnd => _currentScheme.gradientEnd;

  // Text colors
  @override
  Color get textPrimary => _currentScheme.textPrimary;

  @override
  Color get textSecondary => _currentScheme.textSecondary;

  @override
  Color get textTertiary => _currentScheme.textTertiary;

  // Shadow colors
  @override
  Color get shadow => _currentScheme.shadow;
}
