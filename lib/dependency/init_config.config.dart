// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/player/bloc/player_bloc.dart' as _i3;
import '../screen/home/bloc/home_bloc.dart' as _i5;
import '../screen/home/bloc/home_repository.dart' as _i6;
import '../screen/playlist/bloc/playlist_bloc.dart' as _i9;
import '../screen/playlist/bloc/playlist_repository.dart' as _i7;
import '../screen/playlist/bloc/playlist_service.dart' as _i8;
import '../screen/tabbar_controller/bloc/tabbar_bloc.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.PlayerBloc>(() => _i3.PlayerBloc());
  gh.factory<_i4.TabbarBloc>(() => _i4.TabbarBloc());
  gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc(get<_i6.HomeRepository>()));
  gh.factory<_i7.PlaylistRepository>(
      () => _i7.PlaylistRepository(get<_i8.PlaylistService>()));
  gh.factory<_i9.PlayListBloc>(
      () => _i9.PlayListBloc(get<_i7.PlaylistRepository>()));
  gh.singleton<_i6.HomeRepository>(_i6.HomeRepository());
  gh.singleton<_i8.PlaylistService>(_i8.PlaylistService());
  return get;
}
