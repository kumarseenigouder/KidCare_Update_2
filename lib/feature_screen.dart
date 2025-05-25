// feature_screen.dart
import 'package:flutter/material.dart';
import 'ParentPortal_Features/symptoms_screen.dart'; // 👈 optional, if you're conditionally showing Symptoms screen

class FeatureScreen extends StatelessWidget {
  final String title;

  const FeatureScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    if (title == "Symptoms") {
      return const SymptomsScreen(); // 👈 Optional: redirect for Symptoms
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Welcome to $title section!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
