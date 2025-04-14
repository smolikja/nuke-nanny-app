// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'GrokAI Asistent';

  @override
  String get chatPageTitle => 'Chat s Grok';

  @override
  String get messageInputHint => 'Napište zprávu...';

  @override
  String get sendButtonLabel => 'Odeslat';

  @override
  String get emptyMessageError => 'Zpráva nemůže být prázdná';

  @override
  String get emptyChatPlaceholder => 'Začněte konverzaci s Grok AI';

  @override
  String get modelSelectorLabel => 'AI Model';

  @override
  String get modelGrok1 => 'Grok-1';

  @override
  String get modelGrok15 => 'Grok-1.5';

  @override
  String get userRole => 'Vy';

  @override
  String get assistantRole => 'Grok';

  @override
  String get error_network_connection => 'Žádné připojení k internetu. Zkontrolujte nastavení sítě.';

  @override
  String get error_server => 'Chyba serveru. Zkuste to prosím později.';

  @override
  String get error_authentication => 'Ověření selhalo. Přihlaste se prosím znovu.';

  @override
  String get error_local_storage => 'Chyba úložiště. Restartujte prosím aplikaci.';

  @override
  String get error_validation => 'Neplatný vstup. Zkontrolujte prosím svá data.';

  @override
  String get error_unexpected => 'Došlo k neočekávané chybě. Zkuste to prosím znovu.';

  @override
  String get error_rate_limit => 'Překročen limit požadavků. Zkuste to prosím později.';

  @override
  String get error_invalid_api_key => 'Neplatný API klíč. Zkontrolujte prosím konfiguraci.';

  @override
  String get error_model_unavailable => 'Vybraný AI model je momentálně nedostupný.';

  @override
  String get retryButtonLabel => 'Zkusit znovu';

  @override
  String get cancelButtonLabel => 'Zrušit';

  @override
  String get clearChatButtonLabel => 'Vymazat chat';

  @override
  String get settingsButtonLabel => 'Nastavení';
}
