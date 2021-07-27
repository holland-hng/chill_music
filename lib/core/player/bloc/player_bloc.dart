import 'dart:async';

import 'package:chill_music/core/player/widgets/seek_bar.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState());
  AudioPlayer _player = AudioPlayer();

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    switch (event.type) {
      case PlayerEventType.switchPlaylist:
        yield* _handlerSwitchPlayer(event as SwitchPlayerEvent);
        return;
      case PlayerEventType.switchStatusPlayer:
        yield _handleSwitchStatusPlayer(event as SwitchStatusPlayerEvent);
        return;
      case PlayerEventType.seekToTimeline:
        _handleSeekToTimline(event as SeekToTimelineEvent);
        return;
      default:
    }
  }

  PlayerState _handleSeekToTimline(SeekToTimelineEvent event) {
    var _partStrings = event.timeline.split(':');
    var _partInt = [0];
    for (int i = 0; i < _partStrings.length; i++) {
      _partInt.add(
        int.parse(_partStrings[i]),
      );
    }
    var _length = _partInt.length;
    _player.seek(
      Duration(
        seconds: _partInt[_length - 1],
        minutes: _partInt[_length - 2],
        hours: _partInt[_length - 3],
      ),
    );
    return state;
  }

  PlayerState _handleSwitchStatusPlayer(SwitchStatusPlayerEvent event) {
    if (state.player?.playing == false) {
      state.player?.play();
      return state.copyWith(
        playlistDetail: state.playlistDetail,
        playlist: state.playlist,
        player: state.player,
        isPlaying: true,
      );
    } else if (state.player?.playing == true) {
      state.player?.pause();
      return state.copyWith(
        playlistDetail: state.playlistDetail,
        playlist: state.playlist,
        player: state.player,
        isPlaying: false,
      );
    }
    return state;
  }

  Stream<PlayerState> _handlerSwitchPlayer(SwitchPlayerEvent event) async* {
    if (event.playlistDetail.source?.url128kpbs ==
        state.playlistDetail?.source?.url128kpbs) {
      if (_player.playing == false) {
        add(SwitchStatusPlayerEvent());
      }
      yield state;
    } else {
      try {
        yield state.copyWith(
            playlistDetail: event.playlistDetail,
            playlist: event.playlist,
            player: null,
            isPlaying: null);

        await _player.setAudioSource(
          AudioSource.uri(
            Uri.parse(event.playlistDetail.source?.url128kpbs ?? ""),
            tag: MediaItem(
              id: event.playlist.id ?? "",
              artist: event.playlist.publisher?.name ?? "Artist",
              title: event.playlist.title ?? "Song's name",
              artUri: Uri.parse(event.playlist.thumbnail ?? ""),
            ),
          ),
        );
        _player.play();
        yield state.copyWith(
            playlistDetail: event.playlistDetail,
            playlist: event.playlist,
            player: _player,
            isPlaying: true);
      } catch (e) {
        print("Error loading audio source: $e");
        yield state;
      }
    }
  }

  Stream<bool>? get playingStream {
    return state.player?.playingStream;
  }
}

enum PlayerEventType {
  switchPlaylist,
  switchStatusPlayer,
  seekToTimeline,
}

class PlayerState extends Equatable {
  final PlaylistDetailResponse? playlistDetail;
  final PlaylistResponse? playlist;
  final bool? isPlaying;
  final AudioPlayer? player;

  Stream<PositionData>? get positionDataStream {
    if (player == null) {
      return null;
    }
    return Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player!.positionStream,
        player!.bufferedPositionStream,
        player!.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position, bufferedPosition, duration ?? Duration.zero));
  }

  PlayerState({
    this.player,
    this.playlistDetail,
    this.playlist,
    this.isPlaying,
  });
  PlayerState copyWith({
    PlaylistDetailResponse? playlistDetail,
    PlaylistResponse? playlist,
    AudioPlayer? player,
    bool? isPlaying,
  }) {
    return PlayerState(
      playlistDetail: playlistDetail,
      playlist: playlist,
      player: player,
      isPlaying: isPlaying,
    );
  }

  @override
  List<Object?> get props => [
        playlistDetail,
        playlist,
        player,
        isPlaying,
      ];
}

class PlayerEvent {
  final PlayerEventType type;

  PlayerEvent(this.type);
}

class SwitchPlayerEvent extends PlayerEvent {
  final PlaylistDetailResponse playlistDetail;
  final PlaylistResponse playlist;
  SwitchPlayerEvent({
    required this.playlistDetail,
    required this.playlist,
  }) : super(PlayerEventType.switchPlaylist);
}

class SwitchStatusPlayerEvent extends PlayerEvent {
  SwitchStatusPlayerEvent() : super(PlayerEventType.switchStatusPlayer);
}

class SeekToTimelineEvent extends PlayerEvent {
  final String timeline;
  SeekToTimelineEvent({
    required this.timeline,
  }) : super(PlayerEventType.seekToTimeline);
}
