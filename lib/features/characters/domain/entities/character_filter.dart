import 'package:freezed_annotation/freezed_annotation.dart';

import 'character_enums.dart';

part 'character_filter.freezed.dart';

/// Объект-значение с активными фильтрами персонажей + курсором страницы.
@freezed
abstract class CharacterFilter with _$CharacterFilter {
  const CharacterFilter._();

  const factory CharacterFilter({
    String? name,
    CharacterStatus? status,
    String? species,
    CharacterGender? gender,
    String? type,
    @Default(1) int page,
  }) = _CharacterFilter;

  /// True, когда активен любой пользовательский фильтр (не поиск/страница).
  bool get hasActiveFilters =>
      status != null || gender != null || (species?.isNotEmpty ?? false);

  /// Собирает query-параметры для запроса к API.
  Map<String, dynamic> toQuery() => {
        if (name != null && name!.isNotEmpty) 'name': name,
        if (status != null) 'status': status!.apiValue,
        if (species != null && species!.isNotEmpty) 'species': species,
        if (gender != null) 'gender': gender!.apiValue,
        if (type != null && type!.isNotEmpty) 'type': type,
        'page': page,
      };
}
