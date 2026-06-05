import 'package:flutter/material.dart';

import '../../../../core/localization/ru_glossary.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/status_badge.dart';
import '../../domain/entities/character.dart';
import 'character_display.dart';

/// Горизонтальная строка персонажа для списочной раскладки.
class CharacterListTile extends StatelessWidget {
  const CharacterListTile({
    super.key,
    required this.character,
    required this.onTap,
  });

  final Character character;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ClipOval(
              child: AppNetworkImage(
                url: character.image,
                width: 64,
                height: 64,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusBadge(
                    label: context.statusLabel(character.status),
                    color: context.statusColor(character.status),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    character.name,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${context.trSpecies(character.species)}, ${context.genderLabel(character.gender)}',
                    style: context.textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
