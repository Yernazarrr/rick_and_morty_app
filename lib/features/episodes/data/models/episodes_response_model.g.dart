// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodesResponseModel _$EpisodesResponseModelFromJson(
  Map<String, dynamic> json,
) => _EpisodesResponseModel(
  info: PageInfoModel.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>)
      .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EpisodesResponseModelToJson(
  _EpisodesResponseModel instance,
) => <String, dynamic>{'info': instance.info, 'results': instance.results};
