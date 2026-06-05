import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_info_model.freezed.dart';
part 'page_info_model.g.dart';

/// Сопоставляет объект `info` из ответа API для постраничных списков.
@freezed
abstract class PageInfoModel with _$PageInfoModel {
  const PageInfoModel._();

  const factory PageInfoModel({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _PageInfoModel;

  /// Есть ли следующая страница.
  bool get hasNext => next != null;

  factory PageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PageInfoModelFromJson(json);
}
