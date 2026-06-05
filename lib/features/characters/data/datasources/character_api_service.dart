import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/character_model.dart';
import '../models/characters_response_model.dart';

part 'character_api_service.g.dart';

/// Retrofit-определение для эндпойнтов `/character`.
@RestApi()
abstract class CharacterApiService {
  factory CharacterApiService(Dio dio, {String baseUrl}) = _CharacterApiService;

  @GET(ApiConstants.characters)
  Future<CharactersResponseModel> getCharacters(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('${ApiConstants.characters}/{id}')
  Future<CharacterModel> getCharacter(@Path('id') int id);

  @GET('${ApiConstants.characters}/{ids}')
  Future<List<CharacterModel>> getCharactersByIds(@Path('ids') String ids);
}

/// Регистрирует retrofit-клиент для DI.
@module
abstract class CharacterApiModule {
  @lazySingleton
  CharacterApiService characterApiService(Dio dio) => CharacterApiService(dio);
}
