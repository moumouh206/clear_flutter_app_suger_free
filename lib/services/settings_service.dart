// lib/services/settings_service.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService with ChangeNotifier {
  // --- Private variables ---
  bool _isDarkMode = false;
  bool _isHardMode = false;
  Locale _locale = const Locale('en'); // Add locale

  // --- Public getters ---
  bool get isDarkMode => _isDarkMode;
  bool get isHardMode => _isHardMode;
  Locale get locale => _locale; // Add locale getter

  // --- Methods to load and save settings ---

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _isHardMode = prefs.getBool('isHardMode') ?? false;
    // Load locale
    final languageCode = prefs.getString('languageCode') ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> updateDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  Future<void> updateHardMode(bool value) async {
    _isHardMode = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isHardMode', value);
  }

  // --- NEW: Method to update locale ---
  Future<void> updateLocale(Locale newLocale) async {
    if (_locale == newLocale) return;

    _locale = newLocale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', newLocale.languageCode);
  }
}
