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
                  BlocConsumer<DownloadBloc, DownloadState>(
                    builder: (context, state) {
                      var _task = state.tasks[playlist.title];

                      return BouncingButton(
                        key: UniqueKey(),
                        onTap: () {
                          if (_task == null) {
                            _downloadBloc.add(
                              AddToQueueDownloadEvent(
                                playlist: _playerBloc.state.playlist!,
                                detail: _playerBloc.state.playlistDetail!,
                              ),
                            );
                          } else {
                            //do nothing
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 60,
                          color: Colors.transparent,
                          padding: EdgeInsets.only(right: 22),
                          child: Center(
                            child: _task == null
                                ? Icon(
                                    Icons.downloading,
                                    size: 29,
                                  )
                                : _task.status == DownloadStatus.completed
                                    ? Icon(
                                        Icons.check_circle,
                                        size: 27,
                                      )
                                    : Container(
                                        width: 22,
                                        height: 22,
                                        child: StreamBuilder(
                                          stream: _task.progress?.stream,
                                          builder: (BuildContext context,
                                              AsyncSnapshot<int> snapshot) {
                                            return CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                              value: (snapshot.data ?? 0) / 100,
                                              backgroundColor: Colors.grey,
                                            );
                                          },
                                        ),
                                      ),
                          ),
                        ),
                      );
                    },
                    listener: (context, state) {},
                  ),
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
