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
    Map<String, dynamic> _playlistData = {
      "title": event.playlist.title,
      "author": event.playlist.publisher?.name ?? "",
      "playlistId": event.playlist.id,
      "color": event.playlist.colorRaw,
      "thumbnail": event.playlist.thumbnail,
    };
    for (int i = 0; i < _length; i++) {
      String _id = state.playlists?[i].id ?? "";
      if (_id == event.playlist.id) {
        return _removeFormFavorite(
          index: i,
          playlist: event.playlist,
          playlistData: _playlistData,
        );
      }
    }
    return _addToFavorite(
      playlist: event.playlist,
      playlistData: _playlistData,
    );
  }

  FavoriteState _removeFormFavorite(
      {required PlaylistResponse playlist,
      required Map<String, dynamic> playlistData,
      required int index}) {
    List<PlaylistResponse> _playlists = state.playlists ?? [];

    _repository.removeFromFavorites(playlistData);
    List<PlaylistResponse> _playlistss = [];
    _playlists.forEach((element) {
      if (element.id != _playlists[index].id) {
        _playlistss.add(element);
      }
    });
    return new FavoriteState(playlists: _playlistss);
  }

  FavoriteState _addToFavorite(
      {required PlaylistResponse playlist,
      required Map<String, dynamic> playlistData}) {
    List<PlaylistResponse> _playlists = state.playlists ?? [];
    _playlists = [playlist] + _playlists;
    _repository.addToFavoriteList(playlistData);
    return state.copyWith(playlists: _playlists);
  }

  Future<FavoriteState> _fetchData(FetchFavoriteListEvent event) async {
    var _playlists = await _repository.fetchData();
    return state.copyWith(playlists: _playlists);
  }

  bool isLiked(String playlistId) {
    int _length = state.playlists?.length ?? 0;
    for (int i = 0; i < _length; i++) {
      String _id = state.playlists?[i].id ?? "";
      if (_id == playlistId) {
        return true;
      }
    }
    return false;
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
