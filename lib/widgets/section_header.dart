import 'package:flutter/material.dart';

/// Shared section header used across all portfolio sections.
Widget buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 50),
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00FFCC), Color(0xFF00D2FF)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ),
  );
}
