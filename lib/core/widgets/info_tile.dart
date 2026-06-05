import 'package:flutter/material.dart';

import '../utils/extensions.dart';

/// Колонка «подпись + значение», при необходимости кликабельная со стрелкой справа.
/// Используется для строк «место рождения»/«локация» на экране персонажа.
class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: context.textTheme.labelSmall),
                  const SizedBox(height: 4),
                  Text(value, style: context.textTheme.titleMedium),
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.chevron_right_rounded,
                  color: context.statusColors.secondaryText),
          ],
        ),
      ),
    );
  }
}
