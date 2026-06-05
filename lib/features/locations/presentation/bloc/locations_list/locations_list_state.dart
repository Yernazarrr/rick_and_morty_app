part of 'locations_list_bloc.dart';

enum LocationsStatus { initial, loading, success, failure }

class LocationsListState extends Equatable {
  const LocationsListState({
    this.status = LocationsStatus.initial,
    this.locations = const [],
    this.filter = const LocationFilter(),
    this.totalCount = 0,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    this.failure,
  });

  final LocationsStatus status;
  final List<Location> locations;
  final LocationFilter filter;
  final int totalCount;
  final bool hasReachedMax;
  final bool isLoadingMore;
  final Failure? failure;

  LocationsListState copyWith({
    LocationsStatus? status,
    List<Location>? locations,
    LocationFilter? filter,
    int? totalCount,
    bool? hasReachedMax,
    bool? isLoadingMore,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      LocationsListState(
        status: status ?? this.status,
        locations: locations ?? this.locations,
        filter: filter ?? this.filter,
        totalCount: totalCount ?? this.totalCount,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        failure: clearFailure ? null : (failure ?? this.failure),
      );

  @override
  List<Object?> get props => [
        status,
        locations,
        filter,
        totalCount,
        hasReachedMax,
        isLoadingMore,
        failure,
      ];
}
