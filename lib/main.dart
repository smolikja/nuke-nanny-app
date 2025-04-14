import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nuke_nanny/core/l10n/app_localizations.dart';
import 'package:nuke_nanny/core/navigation/router.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _setupLogging();

  // Initialize environment variables
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MyApp()));
}

/// The root widget of the application
class MyApp extends StatelessWidget {
  /// Creates a new [MyApp] instance
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App Boilerplate',
      themeMode: ThemeMode.system,
      routerConfig: getRouter(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
