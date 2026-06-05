import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

/// Загружает набор персонажей по id — используется на экранах локации/эпизода.
@lazySingleton
class GetCharactersByIds implements UseCase<List<Character>, List<int>> {
  const GetCharactersByIds(this._repository);

  final CharacterRepository _repository;

  @override
  Future<Either<Failure, List<Character>>> call(List<int> params) =>
      _repository.getCharactersByIds(params);
}
