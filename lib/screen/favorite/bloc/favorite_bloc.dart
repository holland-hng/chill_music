import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/favorite/bloc/favorite_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _repository;
  FavoriteBloc(this._repository) : super(FavoriteState());

  Future<void> initFetch() async {
    await Future.delayed(const Duration(milliseconds: 500));
    add(FetchFavoriteListEvent());
  }

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    switch (event.type) {
      case FavoriteEventType.fetch:
        yield await _fetchData(event as FetchFavoriteListEvent);
        break;
      case FavoriteEventType.fetchFirstime:
        initFetch();
        break;
      case FavoriteEventType.changeStatus:
        yield _handleChangeStatus(event as ChangeStatusFavoriteEvent);
        break;
      default:
    }
  }

  FavoriteState _handleChangeStatus(ChangeStatusFavoriteEvent event) {
    int _length = state.playlists?.length ?? 0;
    for (int i = 0; i < _length; i++) {
      String _id = state.playlists?[i].id ?? "";
      if (_id == event.playlist.id) {
        return state;
      }
    }
    List<PlaylistResponse> _playlists = state.playlists ?? [];
    _playlists = [event.playlist] + _playlists;

    List<Map<String, dynamic>> _playlistsData = [];
    _length = _playlists.length;
    for (int i = 0; i < _length; i++) {
      _playlistsData = [
            {
              "title": _playlists[i].title,
              "author": _playlists[i].publisher?.name ?? "",
              "playlistId": _playlists[i].id,
              "color": _playlists[i].colorRaw,
              "thumbnail": _playlists[i].thumbnail,
            }
          ] +
          _playlistsData;
    }

    _repository.addTofavoriteList(_playlistsData);
    return state.copyWith(playlists: _playlists);
  }

  Future<FavoriteState> _fetchData(FetchFavoriteListEvent event) async {
    var _playlists = await _repository.fetchData();
    return state.copyWith(playlists: _playlists);
  }
}

class FavoriteState extends Equatable {
  final List<PlaylistResponse>? playlists;

  FavoriteState({this.playlists});

  FavoriteState copyWith({List<PlaylistResponse>? playlists}) {
    List<PlaylistResponse>? _list = List.from(playlists ?? []);
    return FavoriteState(playlists: _list);
  }

  @override
  List<Object?> get props => [playlists];
}

enum FavoriteEventType {
  changeStatus,
  fetch,
  fetchFirstime,
}

class FavoriteEvent {
  final FavoriteEventType type;
  FavoriteEvent(this.type);
}

class FetchFavoriteListEvent extends FavoriteEvent {
  FetchFavoriteListEvent() : super(FavoriteEventType.fetch);
}

class ChangeStatusFavoriteEvent extends FavoriteEvent {
  final PlaylistResponse playlist;
  ChangeStatusFavoriteEvent({required this.playlist})
      : super(FavoriteEventType.changeStatus);
}

class FetchFavoriteFirstimeEvent extends FavoriteEvent {
  FetchFavoriteFirstimeEvent() : super(FavoriteEventType.fetchFirstime);
}
