/// Исключения низкого уровня, генерируемые уровнем данных (datasource).
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

class ServerException extends AppException {
  const ServerException([super.message = 'Server error', this.statusCode]);
  final int? statusCode;
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Not found']);
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection']);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache error']);
}

class UnknownException extends AppException {
  const UnknownException([super.message = 'Unknown error']);
}
