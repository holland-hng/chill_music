import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:equatable/equatable.dart';

// class PlayerBloc extends Bloc<Event, PlayerState>{

// }

enum PlayerEventType {
  switchPlaylist,
}

enum PlayerStatus {
  isPlaying,
  isSeeking,
  isLoading,
}

class PlayerState extends Equatable {
  final PlayerStatus? status;
  final PlaylistResponse? playList;

  PlayerState({this.status, this.playList});
  @override
  List<Object?> get props => [status, playList];
}
