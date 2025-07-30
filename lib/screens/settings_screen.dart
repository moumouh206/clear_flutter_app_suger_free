// lib/screens/settings_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart'; // Import
import '../services/settings_service.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onFullReset;

  const SettingsScreen({super.key, required this.onFullReset});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<SettingsService>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.settings), // Localized
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          ),
          body: ListView(
            children: [
              _SectionHeader(title: l10n.appearance), // Localized
              SwitchListTile(
                title: Text(l10n.darkMode), // Localized
                secondary: const Icon(Icons.dark_mode_outlined),
                value: settings.isDarkMode,
                activeColor: const Color(0xFF5EA500),
                onChanged: (value) {
                  settings.updateDarkMode(value);
                },
              ),
              // --- NEW: Language Selector ---
              ListTile(
                leading: const Icon(Icons.language_outlined),
                title: Text(l10n.language),
                trailing: DropdownButton<Locale>(
                  value: settings.locale,
                  underline: const SizedBox(),
                  items: AppLocalizations.supportedLocales.map((locale) {
                    return DropdownMenuItem<Locale>(
                      value: locale,
                      child: Text(locale.languageCode.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (locale) {
                    if (locale != null) {
                      context.read<SettingsService>().updateLocale(locale);
                    }
                  },
                ),
              ),

              _SectionHeader(title: l10n.challenge), // Localized
              SwitchListTile(
                title: Text(l10n.hardMode), // Localized
                subtitle: Text(l10n.hardModeSubtitle), // Localized
                secondary: const Icon(Icons.local_fire_department_outlined),
                value: settings.isHardMode,
                activeColor: const Color(0xFF5EA500),
                onChanged: (value) {
                  settings.updateHardMode(value);
                },
              ),

              _SectionHeader(title: l10n.data), // Localized
              ListTile(
                leading: const Icon(Icons.delete_forever_outlined),
                title: Text(l10n.resetAllData), // Localized
                subtitle: Text(l10n.resetAllDataSubtitle), // Localized
                onTap: () => _showResetConfirmationDialog(context, l10n),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showResetConfirmationDialog(
      BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(l10n.areYouSure), // Localized
          content: Text(l10n.actionCannotBeUndone), // Localized
          actions: <Widget>[
            TextButton(
              child: Text(l10n.cancel), // Localized
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.pink),
              child: Text(l10n.reset), // Localized
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onFullReset();
              },
            ),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
