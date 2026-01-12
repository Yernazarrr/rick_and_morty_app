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

  String _buildFilters(CharacterFilters? filters) {
    if (filters == null) return '';

    return '?name=${filters.name}'
        '&status=${characterStatusValues[filters.status]}'
        '&gender=${characterGenderValues[filters.gender]}'
        '&type=${filters.type}'
        '&species=${characterSpeciesValues[filters.species]}';
  }
}
