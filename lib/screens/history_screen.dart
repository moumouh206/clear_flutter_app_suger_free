// lib/screens/history_screen.dart

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HistoryScreen extends StatefulWidget {
  final Set<DateTime> successfulDays;
  final Function(DateTime) onDaySelected;

  const HistoryScreen({
    super.key,
    required this.successfulDays,
    required this.onDaySelected,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    // --- Define our accent color once for easy reuse ---
    const accentColor = Color(0xFF5EA500);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your History'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.now().add(const Duration(days: 1)),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                widget.onDaySelected(selectedDay);
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },

              // --- NEW: STYLING OPTIONS ---

              // 1. Style for the day the user taps on (the "selected" day)
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: accentColor
                      .withOpacity(0.5), // A semi-transparent accent color
                  shape: BoxShape.circle,
                ),
                // Style for dates outside the current month (e.g., in the empty space)
                outsideDaysVisible: false,
              ),

              // 2. Custom builders for specific days (TODAY and SUCCESSFUL days)
              calendarBuilders: CalendarBuilders(
                // --- Builder for TODAY'S date ---
                todayBuilder: (context, day, focusedDay) {
                  // This widget is used specifically for the current day's cell.
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      // An outline using our accent color to highlight today.
                      border: Border.all(color: accentColor, width: 2.0),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        // Make the text color match the accent color.
                        style: TextStyle(color: accentColor),
                      ),
                    ),
                  );
                },

                // --- Builder for MARKED (successful) days ---
                markerBuilder: (context, day, events) {
                  final isSuccessful =
                      widget.successfulDays.contains(_normalizeDate(day));
                  if (isSuccessful) {
                    // This will draw a solid circle inside the day's cell.
                    return Center(
                      child: Container(
                        // This container is the visual representation of a successful day.
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: accentColor
                              .withOpacity(0.9), // Solid accent color
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: isDark
                                  ? Colors.black
                                  : Colors.white, // Contrasting text color
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
          ),
          const Spacer(), // Pushes the text to the bottom
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
            child: Text(
              "Tap any day to mark it as sugar-free or to remove it.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // Helper functions that should be inside the State class
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
