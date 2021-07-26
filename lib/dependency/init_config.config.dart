// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/download_worker/bloc/download_bloc.dart' as _i7;
import '../core/download_worker/download_worker.dart' as _i3;
import '../core/notification/notification.dart' as _i8;
import '../core/player/bloc/player_bloc.dart' as _i5;
import '../screen/home/bloc/home_bloc.dart' as _i9;
import '../screen/home/bloc/home_repository.dart' as _i10;
import '../screen/library/bloc/library_repository.dart' as _i4;
import '../screen/playlist/bloc/playlist_bloc.dart' as _i13;
import '../screen/playlist/bloc/playlist_repository.dart' as _i11;
import '../screen/playlist/bloc/playlist_service.dart' as _i12;
import '../screen/tabbar_controller/bloc/tabbar_bloc.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DownloadWorker>(() => _i3.DownloadWorker());
  gh.factory<_i4.LibraryRepository>(() => _i4.LibraryRepository());
  gh.factory<_i5.PlayerBloc>(() => _i5.PlayerBloc());
  gh.factory<_i6.TabbarBloc>(() => _i6.TabbarBloc());
  gh.factory<_i7.DownloadBloc>(() => _i7.DownloadBloc(
      get<_i3.DownloadWorker>(), get<_i8.LocalNotidicationManager>()));
  gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(get<_i10.HomeRepository>()));
  gh.factory<_i11.PlaylistRepository>(
      () => _i11.PlaylistRepository(get<_i12.PlaylistService>()));
  gh.factory<_i13.PlayListBloc>(
      () => _i13.PlayListBloc(get<_i11.PlaylistRepository>()));
  gh.singleton<_i10.HomeRepository>(_i10.HomeRepository());
  gh.singleton<_i8.LocalNotidicationManager>(_i8.LocalNotidicationManager());
  gh.singleton<_i12.PlaylistService>(_i12.PlaylistService());
  return get;
}
