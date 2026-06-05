import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/location.dart';
import '../repositories/location_repository.dart';

@lazySingleton
class GetLocation implements UseCase<Location, int> {
  const GetLocation(this._repository);
  final LocationRepository _repository;

  @override
  Future<Either<Failure, Location>> call(int params) =>
      _repository.getLocationById(params);
}
