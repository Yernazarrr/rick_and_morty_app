// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageInfoModel _$PageInfoModelFromJson(Map<String, dynamic> json) =>
    PageInfoModel(
      count: (json['count'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );
