import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../characters/domain/entities/character.dart';
import '../../../../characters/domain/usecases/get_characters_by_ids.dart';
import '../../../domain/entities/location.dart';
import '../../../domain/usecases/get_location.dart';

part 'location_detail_state.dart';

@injectable
class LocationDetailCubit extends Cubit<LocationDetailState> {
  LocationDetailCubit(this._getLocation, this._getCharactersByIds)
      : super(const LocationDetailState());

  final GetLocation _getLocation;
  final GetCharactersByIds _getCharactersByIds;

  static const int _residentPreviewLimit = 20;

  Future<void> load(int id) async {
    emit(state.copyWith(status: LocationDetailStatus.loading));
    final result = await _getLocation(id);
    await result.fold(
      (failure) async => emit(state.copyWith(
        status: LocationDetailStatus.failure,
        failure: failure,
      )),
      (location) async {
        emit(state.copyWith(
          status: LocationDetailStatus.success,
          location: location,
        ));
        await _loadResidents(location.residentIds);
      },
    );
  }

  Future<void> _loadResidents(List<int> ids) async {
    if (ids.isEmpty) return;
    final result =
        await _getCharactersByIds(ids.take(_residentPreviewLimit).toList());
    result.fold((_) {}, (chars) => emit(state.copyWith(residents: chars)));
  }
}
