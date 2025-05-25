import 'package:flutter/material.dart';

class AdviceDetailScreen extends StatelessWidget {
  final String title;
  final String summary;
  final List<String> details;

  const AdviceDetailScreen({
    Key? key,
    required this.title,
    required this.summary,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(summary, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ...details.map(
              (point) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text("• $point", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
