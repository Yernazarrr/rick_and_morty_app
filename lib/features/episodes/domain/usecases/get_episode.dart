import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/episode.dart';
import '../repositories/episode_repository.dart';

@lazySingleton
class GetEpisode implements UseCase<Episode, int> {
  const GetEpisode(this._repository);
  final EpisodeRepository _repository;

  @override
  Future<Either<Failure, Episode>> call(int params) =>
      _repository.getEpisodeById(params);
}
