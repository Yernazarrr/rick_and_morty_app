import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/paginated.dart';
import '../entities/episode.dart';
import '../entities/episode_filter.dart';

abstract interface class EpisodeRepository {
  Future<Either<Failure, Paginated<Episode>>> getEpisodes(EpisodeFilter filter);
  Future<Either<Failure, Episode>> getEpisodeById(int id);
  Future<Either<Failure, List<Episode>>> getEpisodesByIds(List<int> ids);
}
