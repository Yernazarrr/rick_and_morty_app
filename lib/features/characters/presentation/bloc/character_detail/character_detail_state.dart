part of 'character_detail_cubit.dart';

enum DetailStatus { initial, loading, success, failure }

class CharacterDetailState extends Equatable {
  const CharacterDetailState({
    this.status = DetailStatus.initial,
    this.character,
    this.episodes = const [],
    this.failure,
  });

  final DetailStatus status;
  final Character? character;
  final List<Episode> episodes;
  final Failure? failure;

  CharacterDetailState copyWith({
    DetailStatus? status,
    Character? character,
    List<Episode>? episodes,
    Failure? failure,
  }) {
    return CharacterDetailState(
      status: status ?? this.status,
      character: character ?? this.character,
      episodes: episodes ?? this.episodes,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, character, episodes, failure];
}
