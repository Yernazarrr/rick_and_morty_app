import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/character_model.dart';
import '../models/characters_response_model.dart';
import 'character_api_service.dart';

abstract interface class CharacterRemoteDataSource {
  Future<CharactersResponseModel> getCharacters(Map<String, dynamic> queries);
  Future<CharacterModel> getCharacter(int id);
  Future<List<CharacterModel>> getCharactersByIds(List<int> ids);
}

@LazySingleton(as: CharacterRemoteDataSource)
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  const CharacterRemoteDataSourceImpl(this._api);

  final CharacterApiService _api;

  @override
  Future<CharactersResponseModel> getCharacters(
    Map<String, dynamic> queries,
  ) =>
      _guard(() => _api.getCharacters(queries));

  @override
  Future<CharacterModel> getCharacter(int id) =>
      _guard(() => _api.getCharacter(id));

  @override
  Future<List<CharacterModel>> getCharactersByIds(List<int> ids) async {
    if (ids.isEmpty) return const [];
    // API возвращает один объект (а не список), когда передан только один id.
    if (ids.length == 1) {
      final single = await _guard(() => _api.getCharacter(ids.first));
      return [single];
    }
    return _guard(() => _api.getCharactersByIds(ids.join(',')));
  }

  /// Преобразует [DioException] (уже отображённые ErrorInterceptor)
  /// в типизированные [AppException].
  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      final error = e.error;
      if (error is AppException) throw error;
      throw const UnknownException();
    } catch (_) {
      throw const UnknownException();
    }
  }
}
