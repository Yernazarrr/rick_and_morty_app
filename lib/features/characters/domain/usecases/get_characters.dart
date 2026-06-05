import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/paginated.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/character.dart';
import '../entities/character_filter.dart';
import '../repositories/character_repository.dart';

@lazySingleton
class GetCharacters implements UseCase<Paginated<Character>, CharacterFilter> {
  const GetCharacters(this._repository);

  final CharacterRepository _repository;

  @override
  Future<Either<Failure, Paginated<Character>>> call(CharacterFilter params) =>
      _repository.getCharacters(params);
}
