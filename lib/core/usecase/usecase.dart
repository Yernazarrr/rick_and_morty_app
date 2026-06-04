import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

/// Base contract for all use cases.
/// [Type] is the success result, [Params] the input arguments.
abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Use this when a use case requires no parameters.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
