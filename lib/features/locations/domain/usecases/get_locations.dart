import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/paginated.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/location.dart';
import '../entities/location_filter.dart';
import '../repositories/location_repository.dart';

@lazySingleton
class GetLocations implements UseCase<Paginated<Location>, LocationFilter> {
  const GetLocations(this._repository);
  final LocationRepository _repository;

  @override
  Future<Either<Failure, Paginated<Location>>> call(LocationFilter params) =>
      _repository.getLocations(params);
}
