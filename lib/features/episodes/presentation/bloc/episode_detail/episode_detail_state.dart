part of 'episode_detail_cubit.dart';

enum EpisodeDetailStatus { initial, loading, success, failure }

class EpisodeDetailState extends Equatable {
  const EpisodeDetailState({
    this.status = EpisodeDetailStatus.initial,
    this.episode,
    this.characters = const [],
    this.failure,
  });

  final EpisodeDetailStatus status;
  final Episode? episode;
  final List<Character> characters;
  final Failure? failure;

  EpisodeDetailState copyWith({
    EpisodeDetailStatus? status,
    Episode? episode,
    List<Character>? characters,
    Failure? failure,
  }) =>
      EpisodeDetailState(
        status: status ?? this.status,
        episode: episode ?? this.episode,
        characters: characters ?? this.characters,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [status, episode, characters, failure];
}
