import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/episode.dart';
import '../repositories/episode_repository.dart';

@lazySingleton
class GetEpisodesByIds implements UseCase<List<Episode>, List<int>> {
  const GetEpisodesByIds(this._repository);
  final EpisodeRepository _repository;

  @override
  Future<Either<Failure, List<Episode>>> call(List<int> params) =>
      _repository.getEpisodesByIds(params);
}
