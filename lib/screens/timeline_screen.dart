// lib/screens/timeline_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../l10n/app_localizations.dart'; // Import
import '../models/milestone.dart';

class TimelineScreen extends StatelessWidget {
  final int currentStreak;

  const TimelineScreen({
    super.key,
    required this.currentStreak,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // --- UPDATED: Get localized milestones ---
    final allMilestones = getLocalizedMilestones(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.yourJourney), // Localized
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        itemCount: allMilestones.length,
        itemBuilder: (context, index) {
          final milestone = allMilestones[index];
          final isUnlocked = currentStreak >= milestone.day;

          // Pass l10n to the build method
          return _buildMilestoneCard(
              context, milestone, isUnlocked, colorScheme, isDark, l10n);
        },
      ),
    );
  }

  Widget _buildMilestoneCard(
      BuildContext context,
      Milestone milestone,
      bool isUnlocked,
      ColorScheme colorScheme,
      bool isDark,
      AppLocalizations l10n) {
    const accentColor = Color(0xFF5EA500);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                SvgPicture.asset(
                  milestone.icon,
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
                            l10n.locked, // Localized
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
