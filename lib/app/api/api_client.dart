import 'package:dio/dio.dart';

import 'api.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseURL,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
