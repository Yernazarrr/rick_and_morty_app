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
    this.characterImages = const {},
    this.failure,
  });

  final LocationsStatus status;
  final List<Location> locations;
  final LocationFilter filter;
  final int totalCount;
  final bool hasReachedMax;
  final bool isLoadingMore;

  /// Аватары персонажей по id — для обложек-коллажей карточек локаций
  /// (id персонажа -> URL изображения). Подгружаются отдельным запросом.
  final Map<int, String> characterImages;
  final Failure? failure;

  /// URL аватаров первых жителей локации — основа обложки-коллажа.
  List<String> coverImagesFor(Location location) => location.residentIds
      .take(4)
      .map((id) => characterImages[id])
      .whereType<String>()
      .toList();

  LocationsListState copyWith({
    LocationsStatus? status,
    List<Location>? locations,
    LocationFilter? filter,
    int? totalCount,
    bool? hasReachedMax,
    bool? isLoadingMore,
    Map<int, String>? characterImages,
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
        characterImages: characterImages ?? this.characterImages,
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
        characterImages,
        failure,
      ];
}
