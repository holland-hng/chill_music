import 'package:chill_music/core/download_worker/bloc/download_bloc.dart';
import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/player/widgets/seek_bar.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'button_download.dart';

class PlayAudioView extends StatefulWidget {
  final PlaylistDetailResponse playlistDetail;
  final PlaylistResponse playlist;
  const PlayAudioView(
      {Key? key, required this.playlistDetail, required this.playlist})
      : super(key: key);

  @override
  _PlayAudioViewState createState() =>
      _PlayAudioViewState(playlistDetail, playlist);
}

class _PlayAudioViewState extends State<PlayAudioView>
    with SingleTickerProviderStateMixin {
  final PlaylistDetailResponse playlistDetail;
  final PlaylistResponse playlist;
  late DownloadBloc _downloadBloc;
  late AnimationController _iconController;
  late PlayerBloc _playerBloc;
  late bool _isPlaying;

  _PlayAudioViewState(this.playlistDetail, this.playlist);
  @override
  void initState() {
    _iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _downloadBloc = context.read<DownloadBloc>();
    _playerBloc = context.read<PlayerBloc>();
    _isPlaying = (_playerBloc.state.player?.playing ?? false) &&
        playlistDetail.source?.url128kpbs ==
            _playerBloc.state.playlistDetail?.source?.url128kpbs;
    _playerBloc.add(
      SwitchPlayerEvent(
        playlistDetail: playlistDetail,
        playlist: playlist,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerBloc, PlayerState>(
      builder: (conext, state) {
        return Column(
          children: [
            state.player == null
                ? SeekBar(
                    duration: Duration.zero,
                    position: Duration.zero,
                    bufferedPosition: Duration.zero,
                    onChangeEnd: state.player?.seek,
                  )
                : StreamBuilder<PositionData>(
                    stream: state.positionDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return SeekBar(
                        duration: positionData?.duration ?? Duration.zero,
                        position: positionData?.position ?? Duration.zero,
                        bufferedPosition:
                            positionData?.bufferedPosition ?? Duration.zero,
                        onChangeEnd: state.player?.seek,
                      );
                    },
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DownloadButton(
                      playlist: playlist,
                      downloadBloc: _downloadBloc,
                      playerBloc: _playerBloc),
                  BouncingButton(
                    onTap: () {
                      _playerBloc.add(SwitchStatusPlayerEvent());
                    },
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          32,
                        ),
                      ),
                      child: Center(
                        child: AnimatedIcon(
                          size: 45,
                          icon: _isPlaying == true
                              ? AnimatedIcons.pause_play
                              : AnimatedIcons.play_pause,
                          color: Colors.black,
                          progress: _iconController,
                        ),
                      ),
                    ),
                  ),
                  BouncingButton(
                    onTap: () {},
                    child: Container(
                      width: 70,
                      height: 60,
                      color: Colors.transparent,
                      padding: EdgeInsets.only(right: 5),
                      child: Center(
                        child: Text(
                          "128Kbps",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (_isPlaying) {
          if (state.isPlaying != true) {
            _iconController.forward();
          } else {
            _iconController.reverse();
          }
        } else {
          if (state.isPlaying == true) {
            _iconController.forward();
          } else {
            _iconController.reverse();
          }
        }
      },
    );
  }
}
