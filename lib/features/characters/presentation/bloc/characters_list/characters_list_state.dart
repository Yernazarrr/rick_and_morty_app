part of 'characters_list_bloc.dart';

enum CharactersStatus { initial, loading, success, failure }

enum CharactersViewMode { list, grid }

class CharactersListState extends Equatable {
  const CharactersListState({
    this.status = CharactersStatus.initial,
    this.characters = const [],
    this.filter = const CharacterFilter(),
    this.totalCount = 0,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    this.viewMode = CharactersViewMode.list,
    this.failure,
  });

  final CharactersStatus status;
  final List<Character> characters;
  final CharacterFilter filter;
  final int totalCount;
  final bool hasReachedMax;
  final bool isLoadingMore;
  final CharactersViewMode viewMode;
  final Failure? failure;

  bool get hasActiveFilters => filter.hasActiveFilters;

  CharactersListState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    CharacterFilter? filter,
    int? totalCount,
    bool? hasReachedMax,
    bool? isLoadingMore,
    CharactersViewMode? viewMode,
    Failure? failure,
    bool clearFailure = false,
  }) {
    return CharactersListState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      filter: filter ?? this.filter,
      totalCount: totalCount ?? this.totalCount,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      viewMode: viewMode ?? this.viewMode,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [
        status,
        characters,
        filter,
        totalCount,
        hasReachedMax,
        isLoadingMore,
        viewMode,
        failure,
      ];
}
