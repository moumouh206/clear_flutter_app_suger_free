// lib/screens/slip_up_screen.dart

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; // Import

class SlipUpScreen extends StatelessWidget {
  const SlipUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // Get localizations
    final TextEditingController triggerController = TextEditingController();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      icon: const Icon(Icons.self_improvement, color: Colors.amber, size: 48),
      title: Text(
        l10n.slipUpDialogTitle, // Localized
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.slipUpDialogSubtitle, // Localized
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.slipUpTriggerQuestion, // Localized
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: triggerController,
              decoration: InputDecoration(
                hintText: l10n.slipUpTriggerHint, // Localized
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(l10n.cancel.toUpperCase()), // Localized
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
          child: Text(
            l10n.resetMyStreak, // Localized
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
