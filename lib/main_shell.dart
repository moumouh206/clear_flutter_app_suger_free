// lib/main_shell.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart'; // Import

import 'screens/dashboard_screen.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/timeline_screen.dart';
import 'services/settings_service.dart';
// Note: You would import slip_up_screen.dart here if you were to use it.
// import 'screens/slip_up_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  Set<DateTime> _successfulDays = {};
  int _currentStreak = 0;

  @override
  void initState() {
    super.initState();
    _loadSuccessfulDays();
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

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

  void _calculateCurrentStreak() {
    if (_successfulDays.isEmpty) {
      _currentStreak = 0;
      return;
    }

    final sortedDays = _successfulDays.toList()..sort((a, b) => b.compareTo(a));
    final today = _normalizeDate(DateTime.now());
    final mostRecentDay = sortedDays.first;

    // Check if the most recent day is not today or yesterday
    if (today.difference(mostRecentDay).inDays > 1) {
      _currentStreak = 0;
      return;
    }

    // If today is not successful, the streak is 0, unless the last successful day was yesterday.
    int calculatedStreak;
    if (isSameDay(mostRecentDay, today)) {
      calculatedStreak = 1;
    } else if (isSameDay(
        mostRecentDay, today.subtract(const Duration(days: 1)))) {
      calculatedStreak = 1; // Start from yesterday
    } else {
      _currentStreak = 0;
      return;
    }

    // Continue counting backwards from the most recent day
    for (int i = 0; i < sortedDays.length - 1; i++) {
      final day = sortedDays[i];
      final prevDay = sortedDays[i + 1];
      if (day.difference(prevDay).inDays == 1) {
        calculatedStreak++;
      } else {
        break; // Gap found, stop counting
      }
    }

    // If today is not marked, the visible streak should be based on the past days.
    if (!isSameDay(mostRecentDay, today)) {
      // if yesterday was the last day, streak is correct.
      // if not, it's 0. This is already handled above.
    }

    // Final check: if today is not marked, we show the streak ending yesterday.
    // If today *is* marked, we show the full streak including today.
    // The current logic seems to have a bug where it doesn't correctly calculate if today isn't marked.
    // A simpler logic is to start from today and count backwards.

    _calculateCurrentStreakCorrectly();
  }

  void _calculateCurrentStreakCorrectly() {
    final today = _normalizeDate(DateTime.now());
    int streak = 0;

    // Start from today and go backwards day by day.
    DateTime dayToCheck = today;

    // If today is not a successful day, check from yesterday.
    if (!_successfulDays.contains(dayToCheck)) {
      dayToCheck = today.subtract(const Duration(days: 1));
    }

    while (_successfulDays.contains(dayToCheck)) {
      streak++;
      dayToCheck = dayToCheck.subtract(const Duration(days: 1));
    }

    _currentStreak = streak;
  }

  void toggleDayStatus(DateTime day) {
    final normalizedDay = _normalizeDate(day);
    setState(() {
      if (_successfulDays.contains(normalizedDay)) {
        _successfulDays.remove(normalizedDay);
      } else {
        _successfulDays.add(normalizedDay);
      }
      _calculateCurrentStreakCorrectly();
    });
    _saveSuccessfulDays();
  }

  void _handleYes() {
    toggleDayStatus(DateTime.now());
  }

  // Note: This function just removes today's mark.
  // It doesn't use the SlipUpScreen dialog to reset the whole streak.
  void _handleSlipUp() {
    final today = _normalizeDate(DateTime.now());
    if (_successfulDays.contains(today)) {
      setState(() {
        _successfulDays.remove(today);
        _calculateCurrentStreakCorrectly();
      });
      _saveSuccessfulDays();
      // Need context for both ScaffoldMessenger and AppLocalizations
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.todaysSuccessRemoved)), // Localized
        );
      }
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
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.appHasBeenReset)), // Localized
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // Get localizations
    final settings = context.watch<SettingsService>();
    final accentColor = Color(0xFF5EA500);
    final isTodayMarked =
        _successfulDays.contains(_normalizeDate(DateTime.now()));

    final List<Widget> widgetOptions = <Widget>[
      DashboardScreen(
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
            label: l10n.dashboard, // Localized
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/timeline.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? accentColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: l10n.timeline, // Localized
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? accentColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: l10n.history, // Localized
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? accentColor : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: l10n.settings, // Localized
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
