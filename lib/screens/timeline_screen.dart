// lib/screens/timeline_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/milestone.dart'; // Make sure this path is correct

class TimelineScreen extends StatelessWidget {
  // We ONLY need the current streak now.
  final int currentStreak;

  const TimelineScreen({
    super.key,
    required this.currentStreak,
  });

  @override
  Widget build(BuildContext context) {
    // --- Getting theme data ---
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // The background color will now be handled by the MaterialApp theme
      appBar: AppBar(
        // The AppBar theme is also handled by MaterialApp now
        title: const Text('Your Journey'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        itemCount: allMilestones.length,
        itemBuilder: (context, index) {
          final milestone = allMilestones[index];

          // --- SIMPLIFIED AND CORRECTED LOGIC ---
          // A milestone is unlocked if the user's streak meets or exceeds its day requirement.
          // This removes all the old bugs related to hourly checks.
          final isUnlocked = currentStreak >= milestone.day;

          return _buildMilestoneCard(
              context, milestone, isUnlocked, colorScheme, isDark);
        },
      ),
    );
  }

  // I've kept your excellent theme-aware card building logic.
  Widget _buildMilestoneCard(BuildContext context, Milestone milestone,
      bool isUnlocked, ColorScheme colorScheme, bool isDark) {
    // Using your custom accent color
    const accentColor = Color(0xFF5EA500);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // Your dark/light mode card color logic is great.
      color: isUnlocked
          ? (isDark ? colorScheme.surfaceVariant : Colors.white)
          : (isDark ? colorScheme.surface : Theme.of(context).cardColor),
      elevation: isUnlocked ? 2 : 0,
      shadowColor:
          isUnlocked ? accentColor.withOpacity(0.1) : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Assuming you are using SVGs for icons, this needs to be updated.
                // If you are still using IconData, this is fine.
                SvgPicture.asset(
                  milestone
                      .icon, // This is now the String path e.g., 'assets/icons/star.svg'
                  width: 36,
                  height: 36,
                  colorFilter: ColorFilter.mode(
                    isUnlocked
                        ? accentColor
                        : (isDark ? Colors.grey[700]! : Colors.grey),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        milestone.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: isUnlocked
                              ? colorScheme.onSurface
                              : (isDark ? Colors.grey[400] : Colors.grey[600]),
                        ),
                      ),
                      if (!isUnlocked)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Locked',
                            style: TextStyle(
                              color:
                                  isDark ? Colors.grey[500] : Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (isUnlocked)
              Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 500),
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      milestone.body,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      milestone.mind,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                        fontStyle: FontStyle.italic,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
