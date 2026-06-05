import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/bloc_transformers.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/paginated.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/entities/character_enums.dart';
import '../../../domain/entities/character_filter.dart';
import '../../../domain/usecases/get_characters.dart';

part 'characters_list_event.dart';
part 'characters_list_state.dart';

/// Управляет списком персонажей: поиск, фильтрация, пагинация и режим раскладки.
@injectable
class CharactersListBloc
    extends Bloc<CharactersListEvent, CharactersListState> {
  CharactersListBloc(this._getCharacters) : super(const CharactersListState()) {
    on<CharactersStarted>(_onStarted);
    on<CharactersSearchChanged>(
      _onSearchChanged,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    on<CharactersFilterApplied>(_onFilterApplied);
    on<CharactersFilterReset>(_onFilterReset);
    on<CharactersRefreshed>(_onRefreshed, transformer: restartable());
    on<CharactersNextPageRequested>(
      _onNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 300)),
    );
    on<CharactersViewModeToggled>(_onViewModeToggled);
  }

  final GetCharacters _getCharacters;

  Future<void> _onStarted(
    CharactersStarted event,
    Emitter<CharactersListState> emit,
  ) => _loadFirstPage(emit, state.filter);

  Future<void> _onSearchChanged(
    CharactersSearchChanged event,
    Emitter<CharactersListState> emit,
  ) {
    final query = event.query.trim();
    final filter = state.filter.copyWith(
      name: query.isEmpty ? null : query,
      page: 1,
    );
    return _loadFirstPage(emit, filter);
  }

  Future<void> _onFilterApplied(
    CharactersFilterApplied event,
    Emitter<CharactersListState> emit,
  ) {
    final filter = CharacterFilter(
      name: state.filter.name,
      status: event.status,
      gender: event.gender,
      species: event.species,
      page: 1,
    );
    return _loadFirstPage(emit, filter);
  }

  Future<void> _onFilterReset(
    CharactersFilterReset event,
    Emitter<CharactersListState> emit,
  ) {
    final filter = CharacterFilter(name: state.filter.name, page: 1);
    return _loadFirstPage(emit, filter);
  }

  Future<void> _onRefreshed(
    CharactersRefreshed event,
    Emitter<CharactersListState> emit,
  ) => _loadFirstPage(emit, state.filter.copyWith(page: 1), showSpinner: false);

  Future<void> _onNextPage(
    CharactersNextPageRequested event,
    Emitter<CharactersListState> emit,
  ) async {
    if (state.hasReachedMax ||
        state.isLoadingMore ||
        state.status != CharactersStatus.success) {
      return;
    }
    emit(state.copyWith(isLoadingMore: true));
    final nextFilter = state.filter.copyWith(page: state.filter.page + 1);
    final result = await _getCharacters(nextFilter);
    result.fold(
      (failure) => emit(state.copyWith(isLoadingMore: false)),
      (page) => emit(
        state.copyWith(
          isLoadingMore: false,
          filter: nextFilter,
          characters: [...state.characters, ...page.items],
          hasReachedMax: !page.hasNext,
        ),
      ),
    );
  }

  void _onViewModeToggled(
    CharactersViewModeToggled event,
    Emitter<CharactersListState> emit,
  ) {
    emit(
      state.copyWith(
        viewMode: state.viewMode == CharactersViewMode.list
            ? CharactersViewMode.grid
            : CharactersViewMode.list,
      ),
    );
  }

  Future<void> _loadFirstPage(
    Emitter<CharactersListState> emit,
    CharacterFilter filter, {
    bool showSpinner = true,
  }) async {
    emit(
      state.copyWith(
        status: showSpinner ? CharactersStatus.loading : state.status,
        filter: filter.copyWith(page: 1),
        clearFailure: true,
      ),
    );
    final result = await _getCharacters(filter.copyWith(page: 1));
    result.fold(
      (failure) {
        // API отвечает 404, когда по запросу ничего не найдено — считаем результат пустым.
        if (failure is NotFoundFailure) {
          emit(
            state.copyWith(
              status: CharactersStatus.success,
              characters: const [],
              totalCount: 0,
              hasReachedMax: true,
              clearFailure: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: CharactersStatus.failure,
              failure: failure,
              characters: const [],
              totalCount: 0,
            ),
          );
        }
      },
      (Paginated<Character> page) => emit(
        state.copyWith(
          status: CharactersStatus.success,
          characters: page.items,
          totalCount: page.count,
          hasReachedMax: !page.hasNext,
        ),
      ),
    );
  }
}
