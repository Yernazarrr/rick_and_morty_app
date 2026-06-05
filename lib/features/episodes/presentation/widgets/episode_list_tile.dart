import 'package:flutter/material.dart';

import '../../../../core/localization/ru_glossary.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/episode.dart';

/// Строка одного эпизода (используется в списке эпизодов, а также на
/// экранах деталей персонажа и локации).
class EpisodeListTile extends StatelessWidget {
  const EpisodeListTile({super.key, required this.episode, required this.onTap});

  final Episode episode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            _Thumbnail(code: episode.code),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.episodeNumber(episode.numberInSeason),
                    style: context.textTheme.labelSmall
                        ?.copyWith(color: AppColors.accent),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    context.trEpisodeName(episode.name),
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(episode.airDate, style: context.textTheme.bodyMedium),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                color: context.statusColors.secondaryText),
          ],
        ),
      ),
    );
  }
}

/// Декоративная миниатюра — у эпизодов нет изображения в API, поэтому вместо
/// выдуманного контента показываем код эпизода на цветной плитке.
class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.code});
  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.accent, AppColors.accentDark],
        ),
      ),
      child: Text(
        code,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
