import 'package:flutter/material.dart';

/// Small uppercase status label (e.g. "ЖИВОЙ" / "МЁРТВЫЙ").
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
        color: color,
      ),
    );
  }
}
