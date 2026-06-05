import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/bloc_transformers.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/paginated.dart';
import '../../../domain/entities/location.dart';
import '../../../domain/entities/location_filter.dart';
import '../../../domain/usecases/get_locations.dart';

part 'locations_list_event.dart';
part 'locations_list_state.dart';

@injectable
class LocationsListBloc extends Bloc<LocationsListEvent, LocationsListState> {
  LocationsListBloc(this._getLocations) : super(const LocationsListState()) {
    on<LocationsStarted>(_onStarted);
    on<LocationsSearchChanged>(
      _onSearchChanged,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    on<LocationsRefreshed>(_onRefreshed, transformer: restartable());
    on<LocationsNextPageRequested>(
      _onNextPage,
      transformer: throttleDroppable(const Duration(milliseconds: 300)),
    );
  }

  final GetLocations _getLocations;

  Future<void> _onStarted(
    LocationsStarted event,
    Emitter<LocationsListState> emit,
  ) =>
      _loadFirstPage(emit, state.filter);

  Future<void> _onSearchChanged(
    LocationsSearchChanged event,
    Emitter<LocationsListState> emit,
  ) {
    final query = event.query.trim();
    return _loadFirstPage(
      emit,
      state.filter.copyWith(
        name: query.isEmpty ? null : query,
        page: 1,
      ),
    );
  }

  Future<void> _onRefreshed(
    LocationsRefreshed event,
    Emitter<LocationsListState> emit,
  ) =>
      _loadFirstPage(emit, state.filter, showSpinner: false);

  Future<void> _onNextPage(
    LocationsNextPageRequested event,
    Emitter<LocationsListState> emit,
  ) async {
    if (state.hasReachedMax ||
        state.isLoadingMore ||
        state.status != LocationsStatus.success) {
      return;
    }
    emit(state.copyWith(isLoadingMore: true));
    final nextFilter = state.filter.copyWith(page: state.filter.page + 1);
    final result = await _getLocations(nextFilter);
    result.fold(
      (_) => emit(state.copyWith(isLoadingMore: false)),
      (page) => emit(state.copyWith(
        isLoadingMore: false,
        filter: nextFilter,
        locations: [...state.locations, ...page.items],
        hasReachedMax: !page.hasNext,
      )),
    );
  }

  Future<void> _loadFirstPage(
    Emitter<LocationsListState> emit,
    LocationFilter filter, {
    bool showSpinner = true,
  }) async {
    emit(state.copyWith(
      status: showSpinner ? LocationsStatus.loading : state.status,
      filter: filter.copyWith(page: 1),
      clearFailure: true,
    ));
    final result = await _getLocations(filter.copyWith(page: 1));
    result.fold(
      (failure) {
        if (failure is NotFoundFailure) {
          emit(state.copyWith(
            status: LocationsStatus.success,
            locations: const [],
            totalCount: 0,
            hasReachedMax: true,
            clearFailure: true,
          ));
        } else {
          emit(state.copyWith(
            status: LocationsStatus.failure,
            failure: failure,
            locations: const [],
            totalCount: 0,
          ));
        }
      },
      (Paginated<Location> page) => emit(state.copyWith(
        status: LocationsStatus.success,
        locations: page.items,
        totalCount: page.count,
        hasReachedMax: !page.hasNext,
      )),
    );
  }
}
