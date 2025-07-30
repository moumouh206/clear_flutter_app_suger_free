// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_shell.dart';
import 'services/settings_service.dart';
import 'l10n/app_localizations.dart'; // Import the generated file

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsService = SettingsService();
  settingsService.loadSettings().then((_) {
    runApp(
      ChangeNotifierProvider.value(
        value: settingsService,
        child: const ClearApp(),
      ),
    );
  });
}

class ClearApp extends StatelessWidget {
  const ClearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsService>(
      builder: (context, settings, child) {
        return MaterialApp(
          // --- LOCALIZATION SETUP ---
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: settings.locale, // Set locale from settings

          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) =>
              AppLocalizations.of(context)!.appTitle, // Localized title
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.lightGreen,
            fontFamily: 'Inter',
            scaffoldBackgroundColor: const Color(0xFFF8F8F8),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.lightGreen,
            fontFamily: 'Inter',
          ),
          themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const MainShell(),
        );
      },
    );
  }
}
