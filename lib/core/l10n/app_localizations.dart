import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In cs, this message translates to:
  /// **'GrokAI Asistent'**
  String get appTitle;

  /// No description provided for @chatPageTitle.
  ///
  /// In cs, this message translates to:
  /// **'Chat s Grok'**
  String get chatPageTitle;

  /// No description provided for @messageInputHint.
  ///
  /// In cs, this message translates to:
  /// **'Napište zprávu...'**
  String get messageInputHint;

  /// No description provided for @sendButtonLabel.
  ///
  /// In cs, this message translates to:
  /// **'Odeslat'**
  String get sendButtonLabel;

  /// No description provided for @emptyMessageError.
  ///
  /// In cs, this message translates to:
  /// **'Zpráva nemůže být prázdná'**
  String get emptyMessageError;

  /// No description provided for @emptyChatPlaceholder.
  ///
  /// In cs, this message translates to:
  /// **'Začněte konverzaci s Grok AI'**
  String get emptyChatPlaceholder;

  /// No description provided for @modelSelectorLabel.
  ///
  /// In cs, this message translates to:
  /// **'AI Model'**
  String get modelSelectorLabel;

  /// No description provided for @modelGrok1.
  ///
  /// In cs, this message translates to:
  /// **'Grok-1'**
  String get modelGrok1;

  /// No description provided for @modelGrok15.
  ///
  /// In cs, this message translates to:
  /// **'Grok-1.5'**
  String get modelGrok15;

  /// No description provided for @userRole.
  ///
  /// In cs, this message translates to:
  /// **'Vy'**
  String get userRole;

  /// No description provided for @assistantRole.
  ///
  /// In cs, this message translates to:
  /// **'Grok'**
  String get assistantRole;

  /// No description provided for @error_network_connection.
  ///
  /// In cs, this message translates to:
  /// **'Žádné připojení k internetu. Zkontrolujte nastavení sítě.'**
  String get error_network_connection;

  /// No description provided for @error_server.
  ///
  /// In cs, this message translates to:
  /// **'Chyba serveru. Zkuste to prosím později.'**
  String get error_server;

  /// No description provided for @error_authentication.
  ///
  /// In cs, this message translates to:
  /// **'Ověření selhalo. Přihlaste se prosím znovu.'**
  String get error_authentication;

  /// No description provided for @error_local_storage.
  ///
  /// In cs, this message translates to:
  /// **'Chyba úložiště. Restartujte prosím aplikaci.'**
  String get error_local_storage;

  /// No description provided for @error_validation.
  ///
  /// In cs, this message translates to:
  /// **'Neplatný vstup. Zkontrolujte prosím svá data.'**
  String get error_validation;

  /// No description provided for @error_unexpected.
  ///
  /// In cs, this message translates to:
  /// **'Došlo k neočekávané chybě. Zkuste to prosím znovu.'**
  String get error_unexpected;

  /// No description provided for @error_rate_limit.
  ///
  /// In cs, this message translates to:
  /// **'Překročen limit požadavků. Zkuste to prosím později.'**
  String get error_rate_limit;

  /// No description provided for @error_invalid_api_key.
  ///
  /// In cs, this message translates to:
  /// **'Neplatný API klíč. Zkontrolujte prosím konfiguraci.'**
  String get error_invalid_api_key;

  /// No description provided for @error_model_unavailable.
  ///
  /// In cs, this message translates to:
  /// **'Vybraný AI model je momentálně nedostupný.'**
  String get error_model_unavailable;

  /// No description provided for @retryButtonLabel.
  ///
  /// In cs, this message translates to:
  /// **'Zkusit znovu'**
  String get retryButtonLabel;

  /// No description provided for @cancelButtonLabel.
  ///
  /// In cs, this message translates to:
  /// **'Zrušit'**
  String get cancelButtonLabel;

  /// No description provided for @clearChatButtonLabel.
  ///
  /// In cs, this message translates to:
  /// **'Vymazat chat'**
  String get clearChatButtonLabel;

  /// No description provided for @settingsButtonLabel.
  ///
  /// In cs, this message translates to:
  /// **'Nastavení'**
  String get settingsButtonLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['cs', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs': return AppLocalizationsCs();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
