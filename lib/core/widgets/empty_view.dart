import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, this.message, this.icon});

  final String? message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? Icons.search_off_rounded,
              size: 48, color: context.statusColors.secondaryText),
          const SizedBox(height: 12),
          Text(message ?? context.l10n.emptyList,
              style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
