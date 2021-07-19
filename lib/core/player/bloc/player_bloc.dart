import 'package:chill_music/core/player/widgets/seek_bar.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState());
  AudioPlayer _player = AudioPlayer();
  AudioPlayer get player {
    return _player;
  }

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    switch (event.type) {
      case PlayerEventType.switchPlaylist:
        yield await _handlerSwitchPlayer(event as SwitchPlayerEvent);
        return;
      case PlayerEventType.SwitchStatusPlayerEvent:
        _handleSwitchStatusPlayer(event as SwitchStatusPlayerEvent);
        return;
      default:
    }
  }

  void _handleSwitchStatusPlayer(SwitchStatusPlayerEvent event) {
    if (event.isNeedPlay && !_player.playing) {
      _player.play();
    } else {
      _player.pause();
    }
  }

  Future<PlayerState> _handlerSwitchPlayer(SwitchPlayerEvent event) async {
    if (event.playlist.source?.url128kpbs ==
        state.playList?.source?.url128kpbs) {
      return state;
    } else {
      try {
        await _player.setAudioSource(
          AudioSource.uri(
            Uri.parse(event.playlist.source?.url128kpbs ?? ""),
          ),
        );
        _player.play();
        return state.copyWith(
          playList: event.playlist,
        );
      } catch (e) {
        print("Error loading audio source: $e");
        return state;
      }
    }
  }

  Stream<PositionData>? get positionDataStream {
    return Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position, bufferedPosition, duration ?? Duration.zero));
  }
}

enum PlayerEventType {
  switchPlaylist,
  SwitchStatusPlayerEvent,
}

class PlayerState extends Equatable {
  final PlaylistDetailResponse? playList;

  PlayerState({this.playList});
  PlayerState copyWith({
    PlaylistDetailResponse? playList,
  }) {
    return PlayerState(
      playList: playList,
    );
  }

  @override
  List<Object?> get props => [
        playList,
      ];
}

class PlayerEvent {
  final PlayerEventType type;

  PlayerEvent(this.type);
}

class SwitchPlayerEvent extends PlayerEvent {
  final PlaylistDetailResponse playlist;
  SwitchPlayerEvent({required this.playlist})
      : super(PlayerEventType.switchPlaylist);
}

class SwitchStatusPlayerEvent extends PlayerEvent {
  final bool isNeedPlay;

  SwitchStatusPlayerEvent({required this.isNeedPlay})
      : super(PlayerEventType.SwitchStatusPlayerEvent);
}
