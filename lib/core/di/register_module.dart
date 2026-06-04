import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_client.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => DioClient.create();

  @lazySingleton
  InternetConnection get internetConnection =>
      InternetConnection.createInstance();

  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
