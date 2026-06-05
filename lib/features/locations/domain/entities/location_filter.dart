import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_filter.freezed.dart';

/// Объект-значение с фильтрами локаций + курсором страницы.
@freezed
abstract class LocationFilter with _$LocationFilter {
  const LocationFilter._();

  const factory LocationFilter({
    String? name,
    String? type,
    String? dimension,
    @Default(1) int page,
  }) = _LocationFilter;

  /// True, когда активен любой пользовательский фильтр (не поиск/страница).
  bool get hasActiveFilters =>
      (type?.isNotEmpty ?? false) || (dimension?.isNotEmpty ?? false);

  /// Собирает query-параметры для запроса к API.
  Map<String, dynamic> toQuery() => {
        if (name != null && name!.isNotEmpty) 'name': name,
        if (type != null && type!.isNotEmpty) 'type': type,
        if (dimension != null && dimension!.isNotEmpty) 'dimension': dimension,
        'page': page,
      };
}
