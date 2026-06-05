import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/paginated.dart';
import '../entities/location.dart';
import '../entities/location_filter.dart';

abstract interface class LocationRepository {
  Future<Either<Failure, Paginated<Location>>> getLocations(
    LocationFilter filter,
  );
  Future<Either<Failure, Location>> getLocationById(int id);
}
