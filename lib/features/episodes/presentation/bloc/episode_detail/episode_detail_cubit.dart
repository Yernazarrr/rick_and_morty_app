import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../characters/domain/entities/character.dart';
import '../../../../characters/domain/usecases/get_characters_by_ids.dart';
import '../../../domain/entities/episode.dart';
import '../../../domain/usecases/get_episode.dart';

part 'episode_detail_state.dart';

@injectable
class EpisodeDetailCubit extends Cubit<EpisodeDetailState> {
  EpisodeDetailCubit(this._getEpisode, this._getCharactersByIds)
      : super(const EpisodeDetailState());

  final GetEpisode _getEpisode;
  final GetCharactersByIds _getCharactersByIds;

  static const int _characterPreviewLimit = 20;

  Future<void> load(int id) async {
    emit(state.copyWith(status: EpisodeDetailStatus.loading));
    final result = await _getEpisode(id);
    await result.fold(
      (failure) async => emit(state.copyWith(
        status: EpisodeDetailStatus.failure,
        failure: failure,
      )),
      (episode) async {
        emit(state.copyWith(
          status: EpisodeDetailStatus.success,
          episode: episode,
        ));
        await _loadCharacters(episode.characterIds);
      },
    );
  }

  Future<void> _loadCharacters(List<int> ids) async {
    if (ids.isEmpty) return;
    final result =
        await _getCharactersByIds(ids.take(_characterPreviewLimit).toList());
    result.fold((_) {}, (chars) => emit(state.copyWith(characters: chars)));
  }
}
