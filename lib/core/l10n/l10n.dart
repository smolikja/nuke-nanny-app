import 'package:flutter/material.dart';
import 'package:nuke_nanny/core/l10n/app_localizations.dart';

/// Extension on [BuildContext] to provide easy access to localized strings
extension LocalizationExtension on BuildContext {
  /// Access to the localized strings
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
