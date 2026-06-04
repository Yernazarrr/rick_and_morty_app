import 'package:equatable/equatable.dart';

/// Сбои высокого уровня, потребляемые уровнями домена/представления.
sealed class Failure extends Equatable {
  const Failure([this.message = 'Unexpected error']);
  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error', this.statusCode]);
  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Not found']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unknown error']);
}
