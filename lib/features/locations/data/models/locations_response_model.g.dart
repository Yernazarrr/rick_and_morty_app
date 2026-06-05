// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationsResponseModel _$LocationsResponseModelFromJson(
  Map<String, dynamic> json,
) => _LocationsResponseModel(
  info: PageInfoModel.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>)
      .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LocationsResponseModelToJson(
  _LocationsResponseModel instance,
) => <String, dynamic>{'info': instance.info, 'results': instance.results};
