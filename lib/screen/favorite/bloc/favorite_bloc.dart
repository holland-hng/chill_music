import 'package:chill_music/entity/playlist/playlist_entity.dart';
import 'package:chill_music/screen/favorite/bloc/favorite_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository _repository;
  FavoriteBloc(this._repository) : super(FavoriteState());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {}
}

class FavoriteState extends Equatable {
  final List<PlaylistEntity>? playlists;

  FavoriteState({this.playlists});

  FavoriteState copyWith({List<PlaylistEntity>? playlists}) {
    List<PlaylistEntity>? _list = List.from(playlists ?? []);
    return FavoriteState(playlists: _list);
  }

  @override
  List<Object?> get props => [playlists];
}

enum FavoriteEventType {
  changeStatus,
  fetch,
}

class FavoriteEvent {
  final FavoriteEventType type;
  FavoriteEvent(this.type);
}

class FetchFavoriteListEvent extends FavoriteEvent {
  FetchFavoriteListEvent() : super(FavoriteEventType.fetch);
}

class ChangeStatusFavoriteEvent extends FavoriteEvent {
  ChangeStatusFavoriteEvent() : super(FavoriteEventType.changeStatus);
}
