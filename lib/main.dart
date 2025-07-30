// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_shell.dart';
import 'services/settings_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // We create an instance of our SettingsService here
  final settingsService = SettingsService();
  // And we load the settings before the app even starts
  settingsService.loadSettings().then((_) {
    runApp(
      // The Provider wraps our app and makes the service available
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
    // We listen to the settings to rebuild the MaterialApp when the theme changes
    return Consumer<SettingsService>(
      builder: (context, settings, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clear',
          // THEME LOGIC:
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
            // You can define specific dark theme colors here
          ),
          themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const MainShell(),
        );
      },
    );
  }
}
