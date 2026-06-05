import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/url_id_parser.dart';
import '../../domain/entities/location.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

/// Модель локации из ответа API.
@freezed
abstract class LocationModel with _$LocationModel {
  const LocationModel._();

  const factory LocationModel({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<String> residents,
    required String? created,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  /// Преобразует модель в доменную сущность локации.
  Location toEntity() => Location(
        id: id,
        name: name,
        type: type,
        dimension: dimension,
        residentIds: idsFromUrls(residents),
        created: created == null ? null : DateTime.tryParse(created!),
      );
}
