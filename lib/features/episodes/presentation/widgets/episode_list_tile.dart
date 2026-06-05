import 'package:flutter/material.dart';

import '../../../../core/localization/ru_glossary.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/avatar_collage.dart';
import '../../domain/entities/episode.dart';

/// Строка одного эпизода (используется в списке эпизодов, а также на
/// экранах деталей персонажа и локации).
class EpisodeListTile extends StatelessWidget {
  const EpisodeListTile({
    super.key,
    required this.episode,
    required this.onTap,
    this.coverImages = const [],
  });

  final Episode episode;
  final VoidCallback onTap;

  /// URL аватаров персонажей эпизода для миниатюры-коллажа.
  final List<String> coverImages;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            _Thumbnail(code: episode.code, imageUrls: coverImages),
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

/// Миниатюра эпизода: коллаж из аватаров персонажей эпизода. Пока изображения
/// не загрузились (или их нет) показываем код эпизода на цветной плитке.
class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.code, this.imageUrls = const []});
  final String code;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 52,
        height: 52,
        child: imageUrls.isEmpty
            ? _CodeTile(code: code)
            : AvatarCollage(imageUrls: imageUrls),
      ),
    );
  }
}

class _CodeTile extends StatelessWidget {
  const _CodeTile({required this.code});
  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
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
