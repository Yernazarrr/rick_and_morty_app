import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/episode.dart';
import '../../../domain/entities/episode_filter.dart';
import '../../../domain/usecases/get_episodes.dart';

part 'episodes_list_state.dart';

/// Загружает все эпизоды (набор небольшой — 51 элемент), чтобы сгруппировать их
/// по вкладкам сезонов, затем фильтрует на стороне клиента по поисковому запросу.
@injectable
class EpisodesListCubit extends Cubit<EpisodesListState> {
  EpisodesListCubit(this._getEpisodes) : super(const EpisodesListState());

  final GetEpisodes _getEpisodes;

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
  }

  void search(String query) => emit(state.copyWith(query: query));
}
