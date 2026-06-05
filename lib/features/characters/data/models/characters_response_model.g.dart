// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharactersResponseModel _$CharactersResponseModelFromJson(
  Map<String, dynamic> json,
) => _CharactersResponseModel(
  info: PageInfoModel.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>)
      .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharactersResponseModelToJson(
  _CharactersResponseModel instance,
) => <String, dynamic>{'info': instance.info, 'results': instance.results};
