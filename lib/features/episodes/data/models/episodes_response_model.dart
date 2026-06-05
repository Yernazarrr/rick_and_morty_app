import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/page_info_model.dart';
import 'episode_model.dart';

part 'episodes_response_model.freezed.dart';
part 'episodes_response_model.g.dart';

/// Ответ API со списком эпизодов: сведения о страницах + результаты.
@freezed
abstract class EpisodesResponseModel with _$EpisodesResponseModel {
  const factory EpisodesResponseModel({
    required PageInfoModel info,
    required List<EpisodeModel> results,
  }) = _EpisodesResponseModel;

  factory EpisodesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodesResponseModelFromJson(json);
}
