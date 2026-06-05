import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/episode_model.dart';
import '../models/episodes_response_model.dart';

part 'episode_api_service.g.dart';

@RestApi()
abstract class EpisodeApiService {
  factory EpisodeApiService(Dio dio, {String baseUrl}) = _EpisodeApiService;

  @GET(ApiConstants.episodes)
  Future<EpisodesResponseModel> getEpisodes(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('${ApiConstants.episodes}/{id}')
  Future<EpisodeModel> getEpisode(@Path('id') int id);

  @GET('${ApiConstants.episodes}/{ids}')
  Future<List<EpisodeModel>> getEpisodesByIds(@Path('ids') String ids);
}

@module
abstract class EpisodeApiModule {
  @lazySingleton
  EpisodeApiService episodeApiService(Dio dio) => EpisodeApiService(dio);
}
