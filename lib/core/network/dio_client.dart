import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constants.dart';
import 'interceptors/error_interceptor.dart';

/// Создает сконфигурированный экземпляр [Dio]. Зарегистрируется как синглтон через DI.
class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        responseType: ResponseType.json,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      ErrorInterceptor(),
      PrettyDioLogger(
        requestHeader: false,
        requestBody: false,
        responseHeader: false,
        responseBody: false,
        compact: true,
      ),
    ]);

    return dio;
  }
}
