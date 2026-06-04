import 'package:dio/dio.dart';

import '../../error/exceptions.dart';

/// Преобразует необработанные [DioException] в наши типизированные [AppException], поэтому
/// источники данных (datasource) могут оставаться свободными от особенностей Dio.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final AppException exception = switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const NetworkException(
        'Connection timed out',
      ),
      DioExceptionType.connectionError => const NetworkException(),
      DioExceptionType.badResponse => _mapResponse(err.response),
      DioExceptionType.cancel => const UnknownException('Request cancelled'),
      _ => const UnknownException(),
    };

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: exception,
      ),
    );
  }

  AppException _mapResponse(Response<dynamic>? response) {
    final code = response?.statusCode ?? 0;
    if (code == 404) return const NotFoundException();
    if (code >= 500) return ServerException('Server error', code);
    return ServerException('Request failed', code);
  }
}
