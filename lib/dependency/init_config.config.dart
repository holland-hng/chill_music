// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/download_worker/bloc/download_bloc.dart' as _i6;
import '../core/download_worker/download_worker.dart' as _i3;
import '../core/notification/notification.dart' as _i7;
import '../core/player/bloc/player_bloc.dart' as _i4;
import '../screen/home/bloc/home_bloc.dart' as _i9;
import '../screen/home/bloc/home_repository.dart' as _i10;
import '../screen/library/bloc/library_bloc.dart' as _i11;
import '../screen/library/bloc/library_repository.dart' as _i8;
import '../screen/playlist/bloc/playlist_bloc.dart' as _i14;
import '../screen/playlist/bloc/playlist_repository.dart' as _i12;
import '../screen/playlist/bloc/playlist_service.dart' as _i13;
import '../screen/tabbar_controller/bloc/tabbar_bloc.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DownloadWorker>(() => _i3.DownloadWorker());
  gh.factory<_i4.PlayerBloc>(() => _i4.PlayerBloc());
  gh.factory<_i5.TabbarBloc>(() => _i5.TabbarBloc());
  gh.factory<_i6.DownloadBloc>(() => _i6.DownloadBloc(get<_i3.DownloadWorker>(),
      get<_i7.LocalNotidicationManager>(), get<_i8.LibraryRepository>()));
  gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(get<_i10.HomeRepository>()));
  gh.factory<_i11.LibraryBloc>(
      () => _i11.LibraryBloc(get<_i8.LibraryRepository>()));
  gh.factory<_i12.PlaylistRepository>(
      () => _i12.PlaylistRepository(get<_i13.PlaylistService>()));
  gh.factory<_i14.PlayListBloc>(
      () => _i14.PlayListBloc(get<_i12.PlaylistRepository>()));
  gh.singleton<_i10.HomeRepository>(_i10.HomeRepository());
  gh.singleton<_i8.LibraryRepository>(_i8.LibraryRepository());
  gh.singleton<_i7.LocalNotidicationManager>(_i7.LocalNotidicationManager());
  gh.singleton<_i13.PlaylistService>(_i13.PlaylistService());
  return get;
}
