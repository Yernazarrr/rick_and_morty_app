import 'package:dio/dio.dart';
import '../../app/api/api.dart';
import '../../app/api/api_client.dart';
import '../../app/constants/enums.dart';

abstract class GetEntitiesService {
  Future<(List<Map<String, dynamic>>, Info)> getEntitiesWithInfo(
    String url,
  ) async {
    final Response response = await ApiClient.dio.get(url);
    final data = response.data as Map<String, dynamic>;

    final info = Info.fromJson(data['info']);
    final results = List<Map<String, dynamic>>.from(data['results']);

    return (results, info);
  }
}

class CharacterService extends GetEntitiesService {
  Future<(List<Character>, Info)> getCharacters({
    String? url,
    CharacterFilters? filters,
  }) async {
    final endpoint =
        url ??
        '${Constants.baseURL}${Constants.characterEndpoint}'
            '${_buildFilters(filters)}';

    final (objects, info) = await getEntitiesWithInfo(endpoint);

    final characters = objects.map((e) => Character.fromJson(e)).toList();

    return (characters, info);
  }

  String buildFiltersForUI(CharacterFilters? filters) {
    return _buildFilters(filters);
  }

  String _buildFilters(CharacterFilters? filters) {
    if (filters == null || filters.isEmpty) return '';

    final params = <String>[];

    if (filters.name != null && filters.name!.isNotEmpty) {
      params.add('name=${filters.name}');
    }
    if (filters.status != null) {
      params.add('status=${characterStatusValues[filters.status]}');
    }
    if (filters.gender != null) {
      params.add('gender=${characterGenderValues[filters.gender]}');
    }
    if (filters.species != null) {
      params.add('species=${characterSpeciesValues[filters.species]}');
    }
    if (filters.type != null && filters.type!.isNotEmpty) {
      params.add('type=${filters.type}');
    }

    return params.isEmpty ? '' : '?${params.join('&')}';
  }
}
