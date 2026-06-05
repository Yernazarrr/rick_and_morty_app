import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../episodes/domain/entities/episode.dart';
import '../../../../episodes/domain/usecases/get_episodes_by_ids.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_character.dart';

part 'character_detail_state.dart';

/// Загружает одного персонажа и эпизоды, в которых он появляется.
@injectable
class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  CharacterDetailCubit(this._getCharacter, this._getEpisodesByIds)
    : super(const CharacterDetailState());

  final GetCharacter _getCharacter;
  final GetEpisodesByIds _getEpisodesByIds;

  /// Максимум эпизодов, загружаемых для превью на детальном экране.
  static const int _episodePreviewLimit = 20;

  Future<void> load(int id) async {
    emit(state.copyWith(status: DetailStatus.loading));
    final result = await _getCharacter(id);
    await result.fold(
      (failure) async =>
          emit(state.copyWith(status: DetailStatus.failure, failure: failure)),
      (character) async {
        emit(
          state.copyWith(status: DetailStatus.success, character: character),
        );
        await _loadEpisodes(character.episodeIds);
      },
    );
  }

  Future<void> _loadEpisodes(List<int> ids) async {
    if (ids.isEmpty) return;
    final limited = ids.take(_episodePreviewLimit).toList();
    final result = await _getEpisodesByIds(limited);
    result.fold((_) {}, (episodes) => emit(state.copyWith(episodes: episodes)));
  }
}
