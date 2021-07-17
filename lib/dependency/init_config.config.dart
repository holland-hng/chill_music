// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../screen/home/bloc/home_bloc.dart' as _i3;
import '../screen/home/bloc/home_repository.dart' as _i4;
import '../screen/playlist/bloc/playlist_bloc.dart' as _i7;
import '../screen/playlist/bloc/playlist_repository.dart' as _i5;
import '../screen/playlist/bloc/playlist_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc(get<_i4.HomeRepository>()));
  gh.factory<_i5.PlaylistRepository>(
      () => _i5.PlaylistRepository(get<_i6.PlaylistService>()));
  gh.factory<_i7.PlayListBloc>(
      () => _i7.PlayListBloc(get<_i5.PlaylistRepository>()));
  gh.singleton<_i4.HomeRepository>(_i4.HomeRepository());
  gh.singleton<_i6.PlaylistService>(_i6.PlaylistService());
  return get;
}
