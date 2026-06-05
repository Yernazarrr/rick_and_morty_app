import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';

/// Доменная сущность одного эпизода.
@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required int id,
    required String name,
    required String airDate,

    /// Сырой код эпизода, например "S01E10".
    required String code,

    /// Разобранный номер сезона (начиная с 1).
    required int season,

    /// Разобранный номер эпизода внутри сезона (начиная с 1).
    required int numberInSeason,
    required List<int> characterIds,
    required DateTime? created,
  }) = _Episode;
}
