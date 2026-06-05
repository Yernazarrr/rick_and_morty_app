import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

/// Доменная сущность локации.
@freezed
abstract class Location with _$Location {
  const factory Location({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<int> residentIds,
    required DateTime? created,
  }) = _Location;
}
