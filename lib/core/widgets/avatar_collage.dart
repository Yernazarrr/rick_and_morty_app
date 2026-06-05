import 'package:flutter/material.dart';

import 'app_network_image.dart';

/// Мозаика из аватаров связанных персонажей.
///
/// У эпизодов и локаций нет собственного изображения в Rick & Morty API —
/// есть только списки связанных персонажей (cast у эпизода, residents у
/// локации). Поэтому «обложку» собираем из реальных аватаров этих персонажей,
/// а не из выдуманного контента. Заполняет родителя, поэтому размер задаёт
/// вызывающий код (через [SizedBox]/[AspectRatio]).
class AvatarCollage extends StatelessWidget {
  const AvatarCollage({super.key, required this.imageUrls, this.spacing = 2});

  /// До четырёх URL аватаров. Лишние игнорируются.
  final List<String> imageUrls;

  /// Толщина зазора между плитками мозаики.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final urls = imageUrls.take(4).toList();
    if (urls.isEmpty) return const SizedBox.shrink();

    return switch (urls.length) {
      1 => _cell(urls[0]),
      2 => _row([urls[0], urls[1]]),
      3 => _row([
        urls[0],
      ], trailing: _column([urls[1], urls[2]])),
      _ => _column([
        _row([urls[0], urls[1]]),
        _row([urls[2], urls[3]]),
      ]),
    };
  }

  Widget _cell(String url) => AppNetworkImage(url: url, fit: BoxFit.cover);

  /// Горизонтальный ряд равных по ширине плиток. [items] — это либо строки-URL,
  /// либо готовые виджеты (когда [areWidgets] == true).
  Widget _row(List<Object> items, {Widget? trailing}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) SizedBox(width: spacing),
          Expanded(child: _resolve(items[i])),
        ],
        if (trailing != null) ...[
          SizedBox(width: spacing),
          Expanded(child: trailing),
        ],
      ],
    );
  }

  /// Вертикальная колонка равных по высоте плиток.
  Widget _column(List<Object> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) SizedBox(height: spacing),
          Expanded(child: _resolve(items[i])),
        ],
      ],
    );
  }

  Widget _resolve(Object item) =>
      item is Widget ? item : _cell(item as String);
}