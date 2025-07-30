// lib/models/milestone.dart
import 'package:flutter/material.dart';
// Import the generated localizations file.
// This file is created by Flutter's intl tool and gives access to all your strings.
import '../l10n/app_localizations.dart';

// The Milestone class structure remains the same.
class Milestone {
  final int day;
  final String title;
  final String body;
  final String mind;
  final String icon; // This is the path to the SVG icon

  Milestone({
    this.day = 0,
    required this.title,
    required this.body,
    required this.mind,
    required this.icon,
  });
}

// --- NEW DYNAMIC, LOCALIZED LIST ---
// This function builds the complete list of milestones using the provided
// BuildContext to access the correct AppLocalizations (i.e., the current language strings).
List<Milestone> getLocalizedMilestones(BuildContext context) {
  // Get the localization instance for the current context (the selected language).
  final l10n = AppLocalizations.of(context)!;

  // The list is now built dynamically using the keys from the .arb files.
  return [
    Milestone(
      day: 1,
      title: l10n.milestone1Title,
      body: l10n.milestone1Body,
      mind: l10n.milestone1Mind,
      icon: 'assets/icons/shutdown.svg',
    ),
    Milestone(
      day: 2,
      title: l10n.milestone2Title,
      body: l10n.milestone2Body,
      mind: l10n.milestone2Mind,
      icon: 'assets/icons/clean.svg',
    ),
    Milestone(
      day: 3,
      title: l10n.milestone3Title,
      body: l10n.milestone3Body,
      mind: l10n.milestone3Mind,
      icon: 'assets/icons/peak.svg',
    ),
    Milestone(
      day: 5,
      title: l10n.milestone5Title,
      body: l10n.milestone5Body,
      mind: l10n.milestone5Mind,
      icon: 'assets/icons/microorganisms.svg',
    ),
    Milestone(
      day: 7,
      title: l10n.milestone7Title,
      body: l10n.milestone7Body,
      mind: l10n.milestone7Mind,
      icon: 'assets/icons/taste.svg',
    ),
    Milestone(
      day: 14,
      title: l10n.milestone14Title,
      body: l10n.milestone14Body,
      mind: l10n.milestone14Mind,
      icon: 'assets/icons/glowup.svg',
    ),
    Milestone(
      day: 21,
      title: l10n.milestone21Title,
      body: l10n.milestone21Body,
      mind: l10n.milestone21Mind,
      icon: 'assets/icons/infinity.svg',
    ),
    Milestone(
      day: 30,
      title: l10n.milestone30Title,
      body: l10n.milestone30Body,
      mind: l10n.milestone30Mind,
      icon: 'assets/icons/lightning.svg',
    ),
    Milestone(
      day: 40,
      title: l10n.milestone40Title,
      body: l10n.milestone40Body,
      mind: l10n.milestone40Mind,
      icon: 'assets/icons/dental.svg',
    ),
    Milestone(
      day: 60,
      title: l10n.milestone60Title,
      body: l10n.milestone60Body,
      mind: l10n.milestone60Mind,
      icon: 'assets/icons/sleeping.svg',
    ),
    Milestone(
      day: 75,
      title: l10n.milestone75Title,
      body: l10n.milestone75Body,
      mind: l10n.milestone75Mind,
      icon: 'assets/icons/recycle.svg',
    ),
    Milestone(
      day: 90,
      title: l10n.milestone90Title,
      body: l10n.milestone90Body,
      mind: l10n.milestone90Mind,
      icon: 'assets/icons/mental.svg',
    ),
    Milestone(
      day: 120,
      title: l10n.milestone120Title,
      body: l10n.milestone120Body,
      mind: l10n.milestone120Mind,
      icon: 'assets/icons/gardian.svg',
    ),
    Milestone(
      day: 150,
      title: l10n.milestone150Title,
      body: l10n.milestone150Body,
      mind: l10n.milestone150Mind,
      icon: 'assets/icons/peace_pigeon.svg',
    ),
    Milestone(
      day: 180,
      title: l10n.milestone180Title,
      body: l10n.milestone180Body,
      mind: l10n.milestone180Mind,
      icon: 'assets/icons/heart_with_pulse.svg',
    ),
    Milestone(
      day: 240,
      title: l10n.milestone240Title,
      body: l10n.milestone240Body,
      mind: l10n.milestone240Mind,
      icon: 'assets/icons/delivery_time.svg',
    ),
    Milestone(
      day: 300,
      title: l10n.milestone300Title,
      body: l10n.milestone300Body,
      mind: l10n.milestone300Mind,
      icon: 'assets/icons/warranty.svg',
    ),
    Milestone(
      day: 365,
      title: l10n.milestone365Title,
      body: l10n.milestone365Body,
      mind: l10n.milestone365Mind,
      icon: 'assets/icons/prize.svg',
    ),
  ];
}
