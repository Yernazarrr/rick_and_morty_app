import 'package:flutter/material.dart';

import '../../../../core/localization/ru_glossary.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/status_badge.dart';
import '../../domain/entities/character.dart';
import 'character_display.dart';

/// Карточка для сеточной раскладки — круглый аватар с подписями под ним.
class CharacterGridCard extends StatelessWidget {
  const CharacterGridCard({
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
      borderRadius: BorderRadius.circular(16),
      // Аватар занимает всё оставшееся место (Expanded), а подписи —
      // свой естественный размер. Так колонка всегда укладывается
      // в высоту ячейки и не вызывает overflow при любой её пропорции.
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: AppNetworkImage(url: character.image),
              ),
            ),
          ),
          const SizedBox(height: 10),
          StatusBadge(
            label: context.statusLabel(character.status),
            color: context.statusColor(character.status),
          ),
          const SizedBox(height: 4),
          Text(
            character.name,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            '${context.trSpecies(character.species)}, ${context.genderLabel(character.gender)}',
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
