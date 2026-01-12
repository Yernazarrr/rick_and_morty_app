import '../../app/api/api.dart';

class LocationService extends GetEntitiesService {
  Future<(List<Location>, Info)> getLocations({
    String? url,
    LocationFilters? filters,
  }) async {
    final endpoint =
        url ??
        '${Constants.baseURL}${Constants.locationEndpoint}'
            '${_buildFilters(filters)}';

    final (objects, info) = await getEntitiesWithInfo(endpoint);

    final locations = objects.map((e) => Location.fromJson(e)).toList();

    return (locations, info);
  }

  String _buildFilters(LocationFilters? filters) {
    if (filters == null) return '';

    return '?name=${filters.name}'
        '&type=${filters.type}'
        '&dimension=${filters.dimension}';
  }
}
