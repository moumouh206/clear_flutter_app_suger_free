// lib/main_shell.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/dashboard_screen.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/timeline_screen.dart';
import 'services/settings_service.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // --- STATE ---
  int _selectedIndex = 0;
  Set<DateTime> _successfulDays = {};
  int _currentStreak = 0;

  // --- LIFECYCLE ---
  @override
  void initState() {
    super.initState();
    _loadSuccessfulDays();
  }

  // --- HELPERS ---
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // --- DATA & LOGIC ---
  Future<void> _loadSuccessfulDays() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDays = prefs.getStringList('successfulDays') ?? [];
    setState(() {
      _successfulDays = savedDays.map((day) => DateTime.parse(day)).toSet();
      _calculateCurrentStreak();
    });
  }

  Future<void> _saveSuccessfulDays() async {
    final prefs = await SharedPreferences.getInstance();
    final dateStrings =
        _successfulDays.map((day) => day.toIso8601String()).toList();
    await prefs.setStringList('successfulDays', dateStrings);
  }

  // --- THIS IS THE CORRECTED FUNCTION ---
  void _calculateCurrentStreak() {
    if (_successfulDays.isEmpty) {
      // CHANGE: Removed setState. Just assign the value.
      _currentStreak = 0;
      return;
    }

    final sortedDays = _successfulDays.toList()..sort((a, b) => b.compareTo(a));
    final today = _normalizeDate(DateTime.now());
    final mostRecentDay = sortedDays.first;

    if (today.difference(mostRecentDay).inDays > 1) {
      // CHANGE: Removed setState. Just assign the value.
      _currentStreak = 0;
      return;
    }

    int calculatedStreak = 1;
    for (int i = 0; i < sortedDays.length - 1; i++) {
      final day = sortedDays[i];
      final prevDay = sortedDays[i + 1];
      if (day.difference(prevDay).inDays == 1) {
        calculatedStreak++;
      } else {
        break;
      }
    }

    if (!isSameDay(mostRecentDay, today)) {
      calculatedStreak = 0;
    }

    // CHANGE: Removed setState. Just assign the value.
    _currentStreak = calculatedStreak;
  }

  void toggleDayStatus(DateTime day) {
    final normalizedDay = _normalizeDate(day);
    // The setState here is the ONLY one we need. It will rebuild the UI
    // with the new values calculated by the helper function.
    setState(() {
      if (_successfulDays.contains(normalizedDay)) {
        _successfulDays.remove(normalizedDay);
      } else {
        _successfulDays.add(normalizedDay);
      }
      _calculateCurrentStreak(); // This function now correctly calculates the streak.
    });
    _saveSuccessfulDays();
  }

  void _handleYes() {
    toggleDayStatus(DateTime.now());
  }

  void _handleSlipUp() {
    final today = _normalizeDate(DateTime.now());
    if (_successfulDays.contains(today)) {
      setState(() {
        _successfulDays.remove(today);
        _calculateCurrentStreak();
      });
      _saveSuccessfulDays();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Today's success has been removed.")),
      );
    }
  }

  Future<void> _handleFullReset() async {
    setState(() {
      _successfulDays.clear();
      _currentStreak = 0;
      _selectedIndex = 0;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (mounted) {
      await context.read<SettingsService>().loadSettings();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('App has been reset.')),
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  // --- UI ---
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();
    final accentColor = Color(0xFF5EA500);
    final isTodayMarked =
        _successfulDays.contains(_normalizeDate(DateTime.now()));

    final List<Widget> widgetOptions = <Widget>[
      DashboardScreen(
        // CHANGE: Correctly handle Hard Mode with a nullable int
        streakCount: settings.isHardMode ? null : _currentStreak,
        isTodaySuccessful: isTodayMarked,
        onYes: _handleYes,
        onSlipUp: _handleSlipUp,
      ),
      TimelineScreen(
        currentStreak: _currentStreak,
      ),
      HistoryScreen(
        successfulDays: _successfulDays,
        onDaySelected: toggleDayStatus,
      ),
      SettingsScreen(
        onFullReset: _handleFullReset,
      ),
    ];

    return Scaffold(
      body: Center(child: widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? accentColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/timeline.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? accentColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Timeline',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? accentColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? accentColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

bool isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
