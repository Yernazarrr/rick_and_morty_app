import 'package:freezed_annotation/freezed_annotation.dart';

import 'character_enums.dart';

part 'character.freezed.dart';

/// Доменная сущность одного персонажа.
@freezed
abstract class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required CharacterStatus status,
    required String species,
    required String type,
    required CharacterGender gender,
    required String image,
    required CharacterRef origin,
    required CharacterRef location,
    required List<int> episodeIds,
    required DateTime? created,
  }) = _Character;
}

/// Лёгкая ссылка на происхождение/последнюю известную локацию.
@freezed
abstract class CharacterRef with _$CharacterRef {
  const CharacterRef._();

  const factory CharacterRef({
    required String name,
    int? locationId,
  }) = _CharacterRef;

  /// Есть ли у ссылки связанная локация.
  bool get hasLocation => locationId != null;
}
