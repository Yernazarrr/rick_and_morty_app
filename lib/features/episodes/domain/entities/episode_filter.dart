import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_filter.freezed.dart';

/// Объект-значение с фильтрами эпизодов + курсором страницы.
@freezed
abstract class EpisodeFilter with _$EpisodeFilter {
  const EpisodeFilter._();

  const factory EpisodeFilter({
    String? name,

    /// Фильтр по коду эпизода, например "S01".
    String? episode,
    @Default(1) int page,
  }) = _EpisodeFilter;

  /// Собирает query-параметры для запроса к API.
  Map<String, dynamic> toQuery() => {
        if (name != null && name!.isNotEmpty) 'name': name,
        if (episode != null && episode!.isNotEmpty) 'episode': episode,
        'page': page,
      };
}
