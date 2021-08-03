// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/download_worker/bloc/download_bloc.dart' as _i12;
import '../core/download_worker/download_worker.dart' as _i3;
import '../core/notification/notification.dart' as _i13;
import '../core/player/bloc/player_bloc.dart' as _i4;
import '../screen/favorite/bloc/favorite_bloc.dart' as _i15;
import '../screen/favorite/bloc/favorite_repository.dart' as _i16;
import '../screen/favorite/bloc/favorite_service.dart' as _i19;
import '../screen/home/bloc/home_bloc.dart' as _i8;
import '../screen/home/bloc/home_repository.dart' as _i9;
import '../screen/library/bloc/library_bloc.dart' as _i17;
import '../screen/library/bloc/library_repository.dart' as _i14;
import '../screen/library/bloc/track_repository.dart' as _i20;
import '../screen/login/bloc/auth_bloc.dart' as _i6;
import '../screen/login/bloc/auth_repository.dart' as _i7;
import '../screen/playlist/bloc/playlist_bloc.dart' as _i18;
import '../screen/playlist/bloc/playlist_repository.dart' as _i10;
import '../screen/playlist/bloc/playlist_service.dart' as _i11;
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
  gh.factory<_i6.AuthBloc>(() => _i6.AuthBloc(get<_i7.AuthRepository>()));
  gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc(get<_i9.HomeRepository>()));
  gh.factory<_i10.PlaylistRepository>(
      () => _i10.PlaylistRepository(get<_i11.PlaylistService>()));
  gh.factory<_i12.DownloadBloc>(() => _i12.DownloadBloc(
      get<_i3.DownloadWorker>(),
      get<_i13.LocalNotidicationManager>(),
      get<_i14.LibraryRepository>()));
  gh.factory<_i15.FavoriteBloc>(
      () => _i15.FavoriteBloc(get<_i16.FavoriteRepository>()));
  gh.factory<_i17.LibraryBloc>(
      () => _i17.LibraryBloc(get<_i14.LibraryRepository>()));
  gh.factory<_i18.PlayListBloc>(
      () => _i18.PlayListBloc(get<_i10.PlaylistRepository>()));
  gh.singleton<_i7.AuthRepository>(_i7.AuthRepository());
  gh.singleton<_i19.FavoriteService>(_i19.FavoriteService());
  gh.singleton<_i9.HomeRepository>(_i9.HomeRepository());
  gh.singleton<_i13.LocalNotidicationManager>(_i13.LocalNotidicationManager());
  gh.singleton<_i11.PlaylistService>(_i11.PlaylistService());
  gh.singleton<_i20.TrackRepository>(_i20.TrackRepository());
  gh.singleton<_i16.FavoriteRepository>(
      _i16.FavoriteRepository(get<_i19.FavoriteService>()));
  gh.singleton<_i14.LibraryRepository>(
      _i14.LibraryRepository(get<_i20.TrackRepository>()));
  return get;
}
