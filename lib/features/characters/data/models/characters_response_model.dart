import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/page_info_model.dart';
import 'character_model.dart';

part 'characters_response_model.freezed.dart';
part 'characters_response_model.g.dart';

/// Ответ API со списком персонажей: сведения о страницах + результаты.
@freezed
abstract class CharactersResponseModel with _$CharactersResponseModel {
  const factory CharactersResponseModel({
    required PageInfoModel info,
    required List<CharacterModel> results,
  }) = _CharactersResponseModel;

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseModelFromJson(json);
}
