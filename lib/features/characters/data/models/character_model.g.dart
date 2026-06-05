// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterRefModel _$CharacterRefModelFromJson(Map<String, dynamic> json) =>
    _CharacterRefModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CharacterRefModelToJson(_CharacterRefModel instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_CharacterModel _$CharacterModelFromJson(
  Map<String, dynamic> json,
) => _CharacterModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  type: json['type'] as String,
  gender: json['gender'] as String,
  image: json['image'] as String,
  origin: CharacterRefModel.fromJson(json['origin'] as Map<String, dynamic>),
  location: CharacterRefModel.fromJson(
    json['location'] as Map<String, dynamic>,
  ),
  episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
  created: json['created'] as String?,
);

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
      'created': instance.created,
    };
