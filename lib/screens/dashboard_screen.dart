// lib/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardScreen extends StatelessWidget {
  // CHANGE: Made streakCount nullable to support Hard Mode properly
  final int? streakCount;
  final VoidCallback onYes;
  final VoidCallback onSlipUp;
  final bool isTodaySuccessful;

  const DashboardScreen({
    super.key,
    required this.streakCount,
    required this.onYes,
    required this.onSlipUp,
    required this.isTodaySuccessful,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Animate(
                  key: ValueKey(streakCount),
                  effects: const [
                    FadeEffect(duration: Duration(milliseconds: 300)),
                    SlideEffect(
                      begin: Offset(0, 0.3),
                      duration: Duration(milliseconds: 300),
                    ),
                  ],
                  child: Text(
                    // CHANGE: Handle the null case for Hard Mode
                    streakCount?.toString() ?? '—',
                    style: TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: streakCount == null
                          ? Colors.grey.shade400
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
                Text(
                  'Days Sugar-Free',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: isDark ? Colors.grey[300] : Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 100),
                Text(
                  'Did you stay sugar-free today?',
                  style: TextStyle(
                    fontSize: 18,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onYes,
                  style: isTodaySuccessful
                      ? ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5EA500),
                          foregroundColor: Colors.white,
                          side: const BorderSide(
                              color: Color(0xFF5EA500), width: 2),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        )
                      : ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5EA500),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                  child: Text(
                    isTodaySuccessful
                        ? 'SUCCESS RECORDED ✓'
                        : 'YES, I WAS SUCCESSFUL',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                if (isTodaySuccessful)
                  OutlinedButton(
                    onPressed: onSlipUp,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: isDark ? Colors.grey[600]! : Colors.grey),
                      foregroundColor: isDark ? Colors.grey[300] : Colors.grey,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'I had a slip-up',
                      style: TextStyle(
                          fontSize: 18,
                          color: isDark ? Colors.grey[300] : Colors.grey[700]),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
