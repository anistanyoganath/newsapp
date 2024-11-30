import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  const SectionTitle({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
