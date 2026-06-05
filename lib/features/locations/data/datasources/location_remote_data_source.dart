import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/location_model.dart';
import '../models/locations_response_model.dart';
import 'location_api_service.dart';

abstract interface class LocationRemoteDataSource {
  Future<LocationsResponseModel> getLocations(Map<String, dynamic> queries);
  Future<LocationModel> getLocation(int id);
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  const LocationRemoteDataSourceImpl(this._api);
  final LocationApiService _api;

  @override
  Future<LocationsResponseModel> getLocations(Map<String, dynamic> queries) =>
      _guard(() => _api.getLocations(queries));

  @override
  Future<LocationModel> getLocation(int id) =>
      _guard(() => _api.getLocation(id));

  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      final error = e.error;
      if (error is AppException) throw error;
      throw const UnknownException();
    } catch (_) {
      throw const UnknownException();
    }
  }
}
