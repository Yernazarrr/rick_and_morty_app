part of 'location_detail_cubit.dart';

enum LocationDetailStatus { initial, loading, success, failure }

class LocationDetailState extends Equatable {
  const LocationDetailState({
    this.status = LocationDetailStatus.initial,
    this.location,
    this.residents = const [],
    this.failure,
  });

  final LocationDetailStatus status;
  final Location? location;
  final List<Character> residents;
  final Failure? failure;

  LocationDetailState copyWith({
    LocationDetailStatus? status,
    Location? location,
    List<Character>? residents,
    Failure? failure,
  }) =>
      LocationDetailState(
        status: status ?? this.status,
        location: location ?? this.location,
        residents: residents ?? this.residents,
        failure: failure ?? this.failure,
      );

  @override
  List<Object?> get props => [status, location, residents, failure];
}
