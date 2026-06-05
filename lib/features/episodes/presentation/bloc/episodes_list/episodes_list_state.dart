part of 'episodes_list_cubit.dart';

enum EpisodesStatus { initial, loading, success, failure }

class EpisodesListState extends Equatable {
  const EpisodesListState({
    this.status = EpisodesStatus.initial,
    this.all = const [],
    this.query = '',
    this.characterImages = const {},
    this.failure,
  });

  final EpisodesStatus status;
  final List<Episode> all;
  final String query;

  /// Аватары персонажей по id — для обложек-коллажей плиток эпизодов
  /// (id персонажа -> URL изображения). Подгружаются отдельным запросом.
  final Map<int, String> characterImages;
  final Failure? failure;

  /// URL аватаров первых персонажей эпизода — основа обложки-коллажа.
  List<String> coverImagesFor(Episode episode) => episode.characterIds
      .take(4)
      .map((id) => characterImages[id])
      .whereType<String>()
      .toList();

  /// Отсортированный список сезонов без повторов, присутствующих в данных.
  List<int> get seasons {
    final set = all.map((e) => e.season).toSet().toList()..sort();
    return set;
  }

  /// Эпизоды, сгруппированные по сезонам, после применения поискового запроса.
  Map<int, List<Episode>> get bySeason {
    final filtered = query.trim().isEmpty
        ? all
        : all
            .where((e) =>
                e.name.toLowerCase().contains(query.trim().toLowerCase()) ||
                e.code.toLowerCase().contains(query.trim().toLowerCase()))
            .toList();
    final map = <int, List<Episode>>{};
    for (final e in filtered) {
      (map[e.season] ??= []).add(e);
    }
    for (final list in map.values) {
      list.sort((a, b) => a.numberInSeason.compareTo(b.numberInSeason));
    }
    return map;
  }

  EpisodesListState copyWith({
    EpisodesStatus? status,
    List<Episode>? all,
    String? query,
    Map<int, String>? characterImages,
    Failure? failure,
  }) =>
      EpisodesListState(
        status: status ?? this.status,
        all: all ?? this.all,
        query: query ?? this.query,
        characterImages: characterImages ?? this.characterImages,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [status, all, query, characterImages, failure];
}
