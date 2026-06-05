import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecase/paginated.dart';
import '../../domain/entities/episode.dart';
import '../../domain/entities/episode_filter.dart';
import '../../domain/repositories/episode_repository.dart';
import '../datasources/episode_remote_data_source.dart';

@LazySingleton(as: EpisodeRepository)
class EpisodeRepositoryImpl implements EpisodeRepository {
  const EpisodeRepositoryImpl(this._remote, this._networkInfo);

  final EpisodeRemoteDataSource _remote;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, Paginated<Episode>>> getEpisodes(
    EpisodeFilter filter,
  ) {
    return _run(() async {
      final response = await _remote.getEpisodes(filter.toQuery());
      return Paginated<Episode>(
        items: response.results.map((m) => m.toEntity()).toList(),
        count: response.info.count,
        pages: response.info.pages,
        hasNext: response.info.hasNext,
      );
    });
  }

  @override
  Future<Either<Failure, Episode>> getEpisodeById(int id) =>
      _run(() async => (await _remote.getEpisode(id)).toEntity());

  @override
  Future<Either<Failure, List<Episode>>> getEpisodesByIds(List<int> ids) =>
      _run(
        () async => (await _remote.getEpisodesByIds(
          ids,
        )).map((m) => m.toEntity()).toList(),
      );

  Future<Either<Failure, T>> _run<T>(Future<T> Function() body) async {
    if (!await _networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      return Right(await body());
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on AppException catch (e) {
      return Left(UnknownFailure(e.message));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
