import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/url_id_parser.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/character_enums.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

/// Ссылка на происхождение/локацию в ответе API (имя + URL ресурса).
@freezed
abstract class CharacterRefModel with _$CharacterRefModel {
  const CharacterRefModel._();

  const factory CharacterRefModel({
    required String name,
    required String url,
  }) = _CharacterRefModel;

  factory CharacterRefModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterRefModelFromJson(json);

  /// Преобразует модель в доменную ссылку.
  CharacterRef toEntity() =>
      CharacterRef(name: name, locationId: url.isEmpty ? null : idFromUrl(url));
}

/// Модель персонажа из ответа API.
@freezed
abstract class CharacterModel with _$CharacterModel {
  const CharacterModel._();

  const factory CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required String image,
    required CharacterRefModel origin,
    required CharacterRefModel location,
    required List<String> episode,
    required String? created,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  /// Преобразует модель в доменную сущность персонажа.
  Character toEntity() => Character(
        id: id,
        name: name,
        status: CharacterStatus.fromApi(status),
        species: species,
        type: type,
        gender: CharacterGender.fromApi(gender),
        image: image,
        origin: origin.toEntity(),
        location: location.toEntity(),
        episodeIds: idsFromUrls(episode),
        created: created == null ? null : DateTime.tryParse(created!),
      );
}
