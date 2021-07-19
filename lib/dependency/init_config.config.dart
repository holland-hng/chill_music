// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/player/bloc/player_bloc.dart' as _i3;
import '../screen/home/bloc/home_bloc.dart' as _i4;
import '../screen/home/bloc/home_repository.dart' as _i5;
import '../screen/playlist/bloc/playlist_bloc.dart' as _i8;
import '../screen/playlist/bloc/playlist_repository.dart' as _i6;
import '../screen/playlist/bloc/playlist_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.PlayerBloc>(() => _i3.PlayerBloc());
  gh.factory<_i4.HomeBloc>(() => _i4.HomeBloc(get<_i5.HomeRepository>()));
  gh.factory<_i6.PlaylistRepository>(
      () => _i6.PlaylistRepository(get<_i7.PlaylistService>()));
  gh.factory<_i8.PlayListBloc>(
      () => _i8.PlayListBloc(get<_i6.PlaylistRepository>()));
  gh.singleton<_i5.HomeRepository>(_i5.HomeRepository());
  gh.singleton<_i7.PlaylistService>(_i7.PlaylistService());
  return get;
}
