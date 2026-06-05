import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/page_info_model.dart';
import 'location_model.dart';

part 'locations_response_model.freezed.dart';
part 'locations_response_model.g.dart';

/// Ответ API со списком локаций: сведения о страницах + результаты.
@freezed
abstract class LocationsResponseModel with _$LocationsResponseModel {
  const factory LocationsResponseModel({
    required PageInfoModel info,
    required List<LocationModel> results,
  }) = _LocationsResponseModel;

  factory LocationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationsResponseModelFromJson(json);
}
