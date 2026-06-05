import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/episode_model.dart';
import '../models/episodes_response_model.dart';
import 'episode_api_service.dart';

abstract interface class EpisodeRemoteDataSource {
  Future<EpisodesResponseModel> getEpisodes(Map<String, dynamic> queries);
  Future<EpisodeModel> getEpisode(int id);
  Future<List<EpisodeModel>> getEpisodesByIds(List<int> ids);
}

@LazySingleton(as: EpisodeRemoteDataSource)
class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  const EpisodeRemoteDataSourceImpl(this._api);
  final EpisodeApiService _api;

  @override
  Future<EpisodesResponseModel> getEpisodes(Map<String, dynamic> queries) =>
      _guard(() => _api.getEpisodes(queries));

  @override
  Future<EpisodeModel> getEpisode(int id) => _guard(() => _api.getEpisode(id));

  @override
  Future<List<EpisodeModel>> getEpisodesByIds(List<int> ids) async {
    if (ids.isEmpty) return const [];
    if (ids.length == 1) {
      return [await _guard(() => _api.getEpisode(ids.first))];
    }
    return _guard(() => _api.getEpisodesByIds(ids.join(',')));
  }

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
