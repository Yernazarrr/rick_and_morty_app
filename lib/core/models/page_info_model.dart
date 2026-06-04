import 'package:json_annotation/json_annotation.dart';

part 'page_info_model.g.dart';

/// Сопоставляет объект `info` API, используемого эндпойнта для постраничного списка.
@JsonSerializable(createToJson: false)
class PageInfoModel {
  const PageInfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  bool get hasNext => next != null;

  factory PageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PageInfoModelFromJson(json);
}
