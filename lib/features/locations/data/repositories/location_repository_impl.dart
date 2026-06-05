import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecase/paginated.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/location_filter.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/location_remote_data_source.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  const LocationRepositoryImpl(this._remote, this._networkInfo);

  final LocationRemoteDataSource _remote;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, Paginated<Location>>> getLocations(
    LocationFilter filter,
  ) {
    return _run(() async {
      final response = await _remote.getLocations(filter.toQuery());
      return Paginated<Location>(
        items: response.results.map((m) => m.toEntity()).toList(),
        count: response.info.count,
        pages: response.info.pages,
        hasNext: response.info.hasNext,
      );
    });
  }

  @override
  Future<Either<Failure, Location>> getLocationById(int id) =>
      _run(() async => (await _remote.getLocation(id)).toEntity());

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
