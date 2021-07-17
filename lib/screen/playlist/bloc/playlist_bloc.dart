import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlayListBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlayListBloc(this._repository) : super(PlaylistState());
  final PlaylistRepository _repository;

  @override
  Stream<PlaylistState> mapEventToState(PlaylistEvent event) async* {
    switch (event.type) {
      case PlaylistEventType.fetchContent:
        yield await _handleFetchContent(event as FetchPlaylistContent);
        break;
      default:
    }
  }

  Future<PlaylistState> _handleFetchContent(FetchPlaylistContent event) async {
    if (event.playlistId?.length == 0) {
      return state;
    }
    var _playlistDetail = await _repository.fetchConent(event.playlistId ?? "");
    Map<String, PlaylistDetailResponse> _playlistDetails;
    if (state.playlistDetails == null) {
      _playlistDetails = Map<String, PlaylistDetailResponse>();
    } else {
      _playlistDetails = state.playlistDetails!;
    }
    _playlistDetails[event.playlistId!] = _playlistDetail!;
    return state.copyWith(playlistDetails: _playlistDetails);
  }
}

class PlaylistState extends Equatable {
  final Map<String, PlaylistDetailResponse>? playlistDetails;

  PlaylistState({
    this.playlistDetails,
  });
  @override
  List<Object?> get props => [playlistDetails];
  PlaylistState copyWith({
    Map<String, PlaylistDetailResponse>? playlistDetails,
  }) {
    return PlaylistState(
      playlistDetails: playlistDetails,
    );
  }
}

enum PlaylistEventType {
  fetchContent,
}

class PlaylistEvent {
  final PlaylistEventType? type;
  PlaylistEvent(this.type);
}

class FetchPlaylistContent extends PlaylistEvent {
  final String? playlistId;
  FetchPlaylistContent(this.playlistId) : super(PlaylistEventType.fetchContent);
}
