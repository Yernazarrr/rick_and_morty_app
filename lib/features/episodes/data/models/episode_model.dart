import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/url_id_parser.dart';
import '../../domain/entities/episode.dart';

part 'episode_model.freezed.dart';
part 'episode_model.g.dart';

/// Модель эпизода из ответа API.
@freezed
abstract class EpisodeModel with _$EpisodeModel {
  const EpisodeModel._();

  const factory EpisodeModel({
    required int id,
    required String name,
    @JsonKey(name: 'air_date') required String airDate,
    required String episode,
    required List<String> characters,
    required String? created,
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  /// Преобразует модель в доменную сущность эпизода,
  /// разбирая код вида "S01E10" на номера сезона и эпизода.
  Episode toEntity() {
    final match = RegExp(r'[Ss](\d+)[Ee](\d+)').firstMatch(episode);
    final season = int.tryParse(match?.group(1) ?? '') ?? 0;
    final number = int.tryParse(match?.group(2) ?? '') ?? 0;
    return Episode(
      id: id,
      name: name,
      airDate: airDate,
      code: episode,
      season: season,
      numberInSeason: number,
      characterIds: idsFromUrls(characters),
      created: created == null ? null : DateTime.tryParse(created!),
    );
  }
}
