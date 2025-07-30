// lib/services/settings_service.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService with ChangeNotifier {
  // --- Private variables ---
  bool _isDarkMode = false;
  bool _isHardMode = false;

  // --- Public getters ---
  bool get isDarkMode => _isDarkMode;
  bool get isHardMode => _isHardMode;

  // --- Methods to load and save settings ---

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _isHardMode = prefs.getBool('isHardMode') ?? false;
    notifyListeners(); // Notify widgets that are listening for changes
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
}
