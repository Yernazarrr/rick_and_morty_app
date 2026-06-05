import 'package:flutter/material.dart';

import '../utils/extensions.dart';

/// Два факта «подпись/значение» рядом друг с другом (например, Пол | Раса).
class FactPair extends StatelessWidget {
  const FactPair({
    super.key,
    required this.leftLabel,
    required this.leftValue,
    required this.rightLabel,
    required this.rightValue,
  });

  final String leftLabel;
  final String leftValue;
  final String rightLabel;
  final String rightValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _fact(context, leftLabel, leftValue)),
          Expanded(child: _fact(context, rightLabel, rightValue)),
        ],
      ),
    );
  }

  Widget _fact(BuildContext context, String label, String value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: context.textTheme.labelSmall),
          const SizedBox(height: 4),
          Text(value, style: context.textTheme.titleMedium),
        ],
      );
}
