part of 'episodes_list_cubit.dart';

enum EpisodesStatus { initial, loading, success, failure }

class EpisodesListState extends Equatable {
  const EpisodesListState({
    this.status = EpisodesStatus.initial,
    this.all = const [],
    this.query = '',
    this.failure,
  });

  final EpisodesStatus status;
  final List<Episode> all;
  final String query;
  final Failure? failure;

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
    Failure? failure,
  }) =>
      EpisodesListState(
        status: status ?? this.status,
        all: all ?? this.all,
        query: query ?? this.query,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [status, all, query, failure];
}
