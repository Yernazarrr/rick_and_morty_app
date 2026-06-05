import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecase/paginated.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/character_filter.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_remote_data_source.dart';

@LazySingleton(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  const CharacterRepositoryImpl(this._remote, this._networkInfo);

  final CharacterRemoteDataSource _remote;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, Paginated<Character>>> getCharacters(
    CharacterFilter filter,
  ) {
    return _run(() async {
      final response = await _remote.getCharacters(filter.toQuery());
      return Paginated<Character>(
        items: response.results.map((m) => m.toEntity()).toList(),
        count: response.info.count,
        pages: response.info.pages,
        hasNext: response.info.hasNext,
      );
    });
  }

  @override
  Future<Either<Failure, Character>> getCharacterById(int id) {
    return _run(() async => (await _remote.getCharacter(id)).toEntity());
  }

  @override
  Future<Either<Failure, List<Character>>> getCharactersByIds(List<int> ids) {
    return _run(() async {
      final models = await _remote.getCharactersByIds(ids);
      return models.map((m) => m.toEntity()).toList();
    });
  }

  /// Общая обработка ошибок/подключения для каждого вызова репозитория.
  Future<Either<Failure, T>> _run<T>(Future<T> Function() body) async {
    if (!await _networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }
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
