// lib/screens/settings_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // We'll add this package next
import '../services/settings_service.dart';

class SettingsScreen extends StatelessWidget {
  // A function to call when the user wants to reset everything
  final VoidCallback onFullReset;

  const SettingsScreen({super.key, required this.onFullReset});

  @override
  Widget build(BuildContext context) {
    // 'Consumer' is a widget that listens to a Provider for changes
    return Consumer<SettingsService>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          ),
          body: ListView(
            children: [
              // --- Appearance Section ---
              const _SectionHeader(title: 'APPEARANCE'),
              SwitchListTile(
                title: const Text('Dark Mode'),
                secondary: const Icon(Icons.dark_mode_outlined),
                value: settings.isDarkMode,
                activeColor: const Color(0xFF5EA500),
                onChanged: (value) {
                  settings.updateDarkMode(value);
                },
              ),

              // --- Challenge Section ---
              const _SectionHeader(title: 'CHALLENGE'),
              SwitchListTile(
                title: const Text('Hard Mode'),
                subtitle: const Text('Hides your streak counter.'),
                secondary: const Icon(Icons.local_fire_department_outlined),
                value: settings.isHardMode,
                activeColor: const Color(0xFF5EA500),
                onChanged: (value) {
                  settings.updateHardMode(value);
                },
              ),

              // --- Data Section ---
              const _SectionHeader(title: 'DATA'),
              ListTile(
                leading: const Icon(Icons.delete_forever_outlined),
                title: const Text('Reset All Data'),
                subtitle: const Text(
                    'This will permanently delete your streak and settings.'),
                onTap: () => _showResetConfirmationDialog(context),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method to show a confirmation dialog before deleting data
  void _showResetConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.pink),
              child: const Text('RESET'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
                onFullReset(); // Call the reset function
              },
            ),
          ],
        );
      },
    );
  }
}

// A simple private widget for the section headers
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
