import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

@lazySingleton
class GetCharacter implements UseCase<Character, int> {
  const GetCharacter(this._repository);

  final CharacterRepository _repository;

  @override
  Future<Either<Failure, Character>> call(int params) =>
      _repository.getCharacterById(params);
}
