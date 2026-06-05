part of 'locations_list_bloc.dart';

sealed class LocationsListEvent extends Equatable {
  const LocationsListEvent();
  @override
  List<Object?> get props => [];
}

class LocationsStarted extends LocationsListEvent {
  const LocationsStarted();
}

class LocationsSearchChanged extends LocationsListEvent {
  const LocationsSearchChanged(this.query);
  final String query;
  @override
  List<Object?> get props => [query];
}

class LocationsRefreshed extends LocationsListEvent {
  const LocationsRefreshed();
}

class LocationsNextPageRequested extends LocationsListEvent {
  const LocationsNextPageRequested();
}
