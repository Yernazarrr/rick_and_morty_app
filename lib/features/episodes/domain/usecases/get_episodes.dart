import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/paginated.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/episode.dart';
import '../entities/episode_filter.dart';
import '../repositories/episode_repository.dart';

@lazySingleton
class GetEpisodes implements UseCase<Paginated<Episode>, EpisodeFilter> {
  const GetEpisodes(this._repository);
  final EpisodeRepository _repository;

  @override
  Future<Either<Failure, Paginated<Episode>>> call(EpisodeFilter params) =>
      _repository.getEpisodes(params);
}
