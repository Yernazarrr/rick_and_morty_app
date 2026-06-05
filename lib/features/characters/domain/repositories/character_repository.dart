import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/paginated.dart';
import '../entities/character.dart';
import '../entities/character_filter.dart';

abstract interface class CharacterRepository {
  Future<Either<Failure, Paginated<Character>>> getCharacters(
    CharacterFilter filter,
  );

  Future<Either<Failure, Character>> getCharacterById(int id);

  Future<Either<Failure, List<Character>>> getCharactersByIds(List<int> ids);
}
