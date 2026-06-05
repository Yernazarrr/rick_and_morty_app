import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../characters/domain/usecases/get_characters_by_ids.dart';
import '../../../domain/entities/episode.dart';
import '../../../domain/entities/episode_filter.dart';
import '../../../domain/usecases/get_episodes.dart';

part 'episodes_list_state.dart';

/// Загружает все эпизоды (набор небольшой — 51 элемент), чтобы сгруппировать их
/// по вкладкам сезонов, затем фильтрует на стороне клиента по поисковому запросу.
@injectable
class EpisodesListCubit extends Cubit<EpisodesListState> {
  EpisodesListCubit(this._getEpisodes, this._getCharactersByIds)
      : super(const EpisodesListState());

  final GetEpisodes _getEpisodes;
  final GetCharactersByIds _getCharactersByIds;

  /// Сколько аватаров персонажей берём для обложки-коллажа одного эпизода.
  static const int _coversPerEpisode = 4;

  /// Размер батча id для одного запроса `/character/...` (ограничивает длину URL).
  static const int _idsBatchSize = 80;

  Future<void> load() async {
    emit(state.copyWith(status: EpisodesStatus.loading));
    final collected = <Episode>[];
    var page = 1;
    var hasNext = true;

    while (hasNext) {
      final result = await _getEpisodes(EpisodeFilter(page: page));
      final failed = result.fold(
        (failure) {
          emit(state.copyWith(
            status: EpisodesStatus.failure,
            failure: failure,
          ));
          return true;
        },
        (data) {
          collected.addAll(data.items);
          hasNext = data.hasNext;
          page++;
          return false;
        },
      );
      if (failed) return;
    }

    emit(state.copyWith(status: EpisodesStatus.success, all: collected));
    await _loadCoverImages(collected);
  }

  /// Догружает аватары первых персонажей для обложек-коллажей плиток эпизодов.
  /// Собирает уникальные id по всем эпизодам и тянет их батчами.
  Future<void> _loadCoverImages(List<Episode> episodes) async {
    final ids = <int>{
      for (final episode in episodes)
        ...episode.characterIds.take(_coversPerEpisode),
    }.toList();
    if (ids.isEmpty) return;

    final images = <int, String>{};
    for (var i = 0; i < ids.length; i += _idsBatchSize) {
      final batch = ids.sublist(i, math.min(i + _idsBatchSize, ids.length));
      final result = await _getCharactersByIds(batch);
      result.fold((_) {}, (characters) {
        for (final character in characters) {
          images[character.id] = character.image;
        }
      });
    }

    if (isClosed || images.isEmpty) return;
    emit(state.copyWith(
      characterImages: {...state.characterImages, ...images},
    ));
  }

  void search(String query) => emit(state.copyWith(query: query));
}
