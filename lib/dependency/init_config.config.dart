// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/download_worker/bloc/download_bloc.dart' as _i10;
import '../core/download_worker/download_worker.dart' as _i3;
import '../core/notification/notification.dart' as _i11;
import '../core/player/bloc/player_bloc.dart' as _i4;
import '../screen/home/bloc/home_bloc.dart' as _i6;
import '../screen/home/bloc/home_repository.dart' as _i7;
import '../screen/library/bloc/library_bloc.dart' as _i13;
import '../screen/library/bloc/library_repository.dart' as _i12;
import '../screen/library/bloc/track_repository.dart' as _i15;
import '../screen/playlist/bloc/playlist_bloc.dart' as _i14;
import '../screen/playlist/bloc/playlist_repository.dart' as _i8;
import '../screen/playlist/bloc/playlist_service.dart' as _i9;
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
  gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc(get<_i7.HomeRepository>()));
  gh.factory<_i8.PlaylistRepository>(
      () => _i8.PlaylistRepository(get<_i9.PlaylistService>()));
  gh.factory<_i10.DownloadBloc>(() => _i10.DownloadBloc(
      get<_i3.DownloadWorker>(),
      get<_i11.LocalNotidicationManager>(),
      get<_i12.LibraryRepository>()));
  gh.factory<_i13.LibraryBloc>(
      () => _i13.LibraryBloc(get<_i12.LibraryRepository>()));
  gh.factory<_i14.PlayListBloc>(
      () => _i14.PlayListBloc(get<_i8.PlaylistRepository>()));
  gh.singleton<_i7.HomeRepository>(_i7.HomeRepository());
  gh.singleton<_i11.LocalNotidicationManager>(_i11.LocalNotidicationManager());
  gh.singleton<_i9.PlaylistService>(_i9.PlaylistService());
  gh.singleton<_i15.TrackRepository>(_i15.TrackRepository());
  gh.singleton<_i12.LibraryRepository>(
      _i12.LibraryRepository(get<_i15.TrackRepository>()));
  return get;
}
