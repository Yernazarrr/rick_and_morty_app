import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

/// Базовый контракт для всех вариантов использования.
/// [Type] — результат успеха, [Params] — входные аргументы.
abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
