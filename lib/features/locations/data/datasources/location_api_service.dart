import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/location_model.dart';
import '../models/locations_response_model.dart';

part 'location_api_service.g.dart';

@RestApi()
abstract class LocationApiService {
  factory LocationApiService(Dio dio, {String baseUrl}) = _LocationApiService;

  @GET(ApiConstants.locations)
  Future<LocationsResponseModel> getLocations(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('${ApiConstants.locations}/{id}')
  Future<LocationModel> getLocation(@Path('id') int id);
}

@module
abstract class LocationApiModule {
  @lazySingleton
  LocationApiService locationApiService(Dio dio) => LocationApiService(dio);
}
