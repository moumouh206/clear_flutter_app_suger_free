// lib/screens/slip_up_screen.dart

import 'package:flutter/material.dart';

class SlipUpScreen extends StatelessWidget {
  const SlipUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The TextEditingController allows us to get the text from the input field.
    // We aren't saving it yet, but this is how you would.
    final TextEditingController triggerController = TextEditingController();

    return AlertDialog(
      // A rounded shape for the dialog
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // A nice icon at the top
      icon: const Icon(Icons.self_improvement, color: Colors.amber, size: 48),
      title: const Text(
        "It's okay, it happens.",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      // The main content of the dialog
      content: SingleChildScrollView(
        // Allows scrolling if keyboard is open
        child: Column(
          mainAxisSize: MainAxisSize.min, // Take up minimum space
          children: [
            const Text(
              "One slip-up doesn't erase your progress. Every sugar-free day counts.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Text(
              "What was the trigger? (Optional)",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: triggerController,
              // Simple styling for the text field
              decoration: const InputDecoration(
                hintText: "e.g., stress at work, a party...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
              ),
              maxLines: 2, // Allow for a bit more text
            ),
          ],
        ),
      ),
      // The action buttons at the bottom
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // This is how you close the dialog and pass 'false' back
            Navigator.of(context).pop(false);
          },
          child: const Text('CANCEL'),
        ),
        // A more prominent button to confirm the reset
        ElevatedButton(
          onPressed: () {
            // You could save the trigger text here if you wanted:
            // final triggerText = _triggerController.text;
            // print("User's trigger: $triggerText");

            // Close the dialog and pass 'true' back, confirming the reset
            Navigator.of(context).pop(true);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
          child: const Text('RESET MY STREAK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
