// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/characters/data/datasources/character_api_service.dart'
    as _i734;
import '../../features/characters/data/datasources/character_remote_data_source.dart'
    as _i857;
import '../../features/characters/data/repositories/character_repository_impl.dart'
    as _i51;
import '../../features/characters/domain/repositories/character_repository.dart'
    as _i1057;
import '../../features/characters/domain/usecases/get_character.dart' as _i947;
import '../../features/characters/domain/usecases/get_characters.dart' as _i409;
import '../../features/characters/domain/usecases/get_characters_by_ids.dart'
    as _i415;
import '../../features/characters/presentation/bloc/character_detail/character_detail_cubit.dart'
    as _i891;
import '../../features/characters/presentation/bloc/characters_list/characters_list_bloc.dart'
    as _i108;
import '../../features/episodes/data/datasources/episode_api_service.dart'
    as _i496;
import '../../features/episodes/data/datasources/episode_remote_data_source.dart'
    as _i703;
import '../../features/episodes/data/repositories/episode_repository_impl.dart'
    as _i513;
import '../../features/episodes/domain/repositories/episode_repository.dart'
    as _i132;
import '../../features/episodes/domain/usecases/get_episode.dart' as _i371;
import '../../features/episodes/domain/usecases/get_episodes.dart' as _i929;
import '../../features/episodes/domain/usecases/get_episodes_by_ids.dart'
    as _i321;
import '../../features/episodes/presentation/bloc/episode_detail/episode_detail_cubit.dart'
    as _i967;
import '../../features/episodes/presentation/bloc/episodes_list/episodes_list_cubit.dart'
    as _i925;
import '../../features/locations/data/datasources/location_api_service.dart'
    as _i89;
import '../../features/locations/data/datasources/location_remote_data_source.dart'
    as _i338;
import '../../features/locations/data/repositories/location_repository_impl.dart'
    as _i399;
import '../../features/locations/domain/repositories/location_repository.dart'
    as _i217;
import '../../features/locations/domain/usecases/get_location.dart' as _i280;
import '../../features/locations/domain/usecases/get_locations.dart' as _i190;
import '../../features/locations/presentation/bloc/location_detail/location_detail_cubit.dart'
    as _i542;
import '../../features/locations/presentation/bloc/locations_list/locations_list_bloc.dart'
    as _i37;
import '../../features/settings/presentation/controller/profile_controller.dart'
    as _i68;
import '../network/network_info.dart' as _i932;
import '../theme/app_settings_controller.dart' as _i692;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final characterApiModule = _$CharacterApiModule();
    final episodeApiModule = _$EpisodeApiModule();
    final locationApiModule = _$LocationApiModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i161.InternetConnection>(
      () => registerModule.internetConnection,
    );
    gh.lazySingleton<_i734.CharacterApiService>(
      () => characterApiModule.characterApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i496.EpisodeApiService>(
      () => episodeApiModule.episodeApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i89.LocationApiService>(
      () => locationApiModule.locationApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i338.LocationRemoteDataSource>(
      () => _i338.LocationRemoteDataSourceImpl(gh<_i89.LocationApiService>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i161.InternetConnection>()),
    );
    gh.lazySingleton<_i692.AppSettingsController>(
      () => _i692.AppSettingsController(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i68.ProfileController>(
      () => _i68.ProfileController(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i857.CharacterRemoteDataSource>(
      () =>
          _i857.CharacterRemoteDataSourceImpl(gh<_i734.CharacterApiService>()),
    );
    gh.lazySingleton<_i217.LocationRepository>(
      () => _i399.LocationRepositoryImpl(
        gh<_i338.LocationRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i703.EpisodeRemoteDataSource>(
      () => _i703.EpisodeRemoteDataSourceImpl(gh<_i496.EpisodeApiService>()),
    );
    gh.lazySingleton<_i1057.CharacterRepository>(
      () => _i51.CharacterRepositoryImpl(
        gh<_i857.CharacterRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i132.EpisodeRepository>(
      () => _i513.EpisodeRepositoryImpl(
        gh<_i703.EpisodeRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i280.GetLocation>(
      () => _i280.GetLocation(gh<_i217.LocationRepository>()),
    );
    gh.lazySingleton<_i190.GetLocations>(
      () => _i190.GetLocations(gh<_i217.LocationRepository>()),
    );
    gh.lazySingleton<_i371.GetEpisode>(
      () => _i371.GetEpisode(gh<_i132.EpisodeRepository>()),
    );
    gh.lazySingleton<_i929.GetEpisodes>(
      () => _i929.GetEpisodes(gh<_i132.EpisodeRepository>()),
    );
    gh.lazySingleton<_i321.GetEpisodesByIds>(
      () => _i321.GetEpisodesByIds(gh<_i132.EpisodeRepository>()),
    );
    gh.lazySingleton<_i947.GetCharacter>(
      () => _i947.GetCharacter(gh<_i1057.CharacterRepository>()),
    );
    gh.lazySingleton<_i409.GetCharacters>(
      () => _i409.GetCharacters(gh<_i1057.CharacterRepository>()),
    );
    gh.lazySingleton<_i415.GetCharactersByIds>(
      () => _i415.GetCharactersByIds(gh<_i1057.CharacterRepository>()),
    );
    gh.factory<_i967.EpisodeDetailCubit>(
      () => _i967.EpisodeDetailCubit(
        gh<_i371.GetEpisode>(),
        gh<_i415.GetCharactersByIds>(),
      ),
    );
    gh.factory<_i542.LocationDetailCubit>(
      () => _i542.LocationDetailCubit(
        gh<_i280.GetLocation>(),
        gh<_i415.GetCharactersByIds>(),
      ),
    );
    gh.factory<_i925.EpisodesListCubit>(
      () => _i925.EpisodesListCubit(
        gh<_i929.GetEpisodes>(),
        gh<_i415.GetCharactersByIds>(),
      ),
    );
    gh.factory<_i891.CharacterDetailCubit>(
      () => _i891.CharacterDetailCubit(
        gh<_i947.GetCharacter>(),
        gh<_i321.GetEpisodesByIds>(),
      ),
    );
    gh.factory<_i37.LocationsListBloc>(
      () => _i37.LocationsListBloc(
        gh<_i190.GetLocations>(),
        gh<_i415.GetCharactersByIds>(),
      ),
    );
    gh.factory<_i108.CharactersListBloc>(
      () => _i108.CharactersListBloc(gh<_i409.GetCharacters>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

class _$CharacterApiModule extends _i734.CharacterApiModule {}

class _$EpisodeApiModule extends _i496.EpisodeApiModule {}

class _$LocationApiModule extends _i89.LocationApiModule {}
