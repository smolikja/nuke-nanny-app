// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'GrokAI Assistant';

  @override
  String get chatPageTitle => 'Chat with Grok';

  @override
  String get messageInputHint => 'Type your message...';

  @override
  String get sendButtonLabel => 'Send';

  @override
  String get emptyMessageError => 'Message cannot be empty';

  @override
  String get emptyChatPlaceholder => 'Start a conversation with Grok AI';

  @override
  String get modelSelectorLabel => 'AI Model';

  @override
  String get modelGrok1 => 'Grok-1';

  @override
  String get modelGrok15 => 'Grok-1.5';

  @override
  String get userRole => 'You';

  @override
  String get assistantRole => 'Grok';

  @override
  String get error_network_connection => 'No internet connection. Please check your network settings.';

  @override
  String get error_server => 'Server error. Please try again later.';

  @override
  String get error_authentication => 'Authentication failed. Please log in again.';

  @override
  String get error_local_storage => 'Storage error. Please restart the app.';

  @override
  String get error_validation => 'Invalid input. Please check your data.';

  @override
  String get error_unexpected => 'Unexpected error occurred. Please try again.';

  @override
  String get error_rate_limit => 'Rate limit exceeded. Please try again later.';

  @override
  String get error_invalid_api_key => 'Invalid API key. Please check your configuration.';

  @override
  String get error_model_unavailable => 'Selected AI model is currently unavailable.';

  @override
  String get retryButtonLabel => 'Retry';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get clearChatButtonLabel => 'Clear Chat';

  @override
  String get settingsButtonLabel => 'Settings';
}
