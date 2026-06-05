import 'package:flutter/material.dart';

import '../../../../core/localization/ru_glossary.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/avatar_collage.dart';
import '../../domain/entities/location.dart';

/// Карточка для списка локаций. У локаций нет собственного изображения в API,
/// поэтому обложку собираем из аватаров жителей ([coverImages]); пока они не
/// загрузились (или локация пуста) показываем декоративный баннер с планетой.
class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.location,
    required this.onTap,
    this.coverImages = const [],
  });

  final Location location;
  final VoidCallback onTap;

  /// URL аватаров жителей для обложки-коллажа.
  final List<String> coverImages;

  @override
  Widget build(BuildContext context) {
    final subtitle = [
      if (location.type.isNotEmpty) context.trLocationType(location.type),
      if (location.dimension.isNotEmpty) context.trDimension(location.dimension),
    ].join(' · ');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 132,
              child: coverImages.isEmpty
                  ? _Banner(seed: location.id)
                  : AvatarCollage(imageUrls: coverImages),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.trLocationName(location.name),
                    style: context.textTheme.titleLarge,
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(subtitle, style: context.textTheme.bodyMedium),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.seed});
  final int seed;

  @override
  Widget build(BuildContext context) {
    // Слегка варьируем оттенок для каждой локации ради разнообразия.
    final hue = (seed * 47) % 360;
    final base = HSLColor.fromAHSL(1, hue.toDouble(), 0.45, 0.45).toColor();
    return Container(
      height: 132,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [base, AppColors.accentDark],
        ),
      ),
      child: const Center(
        child: Icon(Icons.public, color: Colors.white70, size: 56),
      ),
    );
  }
}
