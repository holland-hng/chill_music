import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/player/widgets/seek_bar.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late bool _isPlaying;
  late AnimationController _iconController;
  late PlayerBloc _bloc;

  _PlayAudioViewState(this.playlistDetail, this.playlist);
  @override
  void initState() {
    _iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _bloc = context.read<PlayerBloc>();
    _isPlaying = (_bloc.state.player?.playing ?? false) &&
        playlistDetail.source?.url128kpbs ==
            _bloc.state.playlistDetail?.source?.url128kpbs;
    _bloc.add(
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
                  Container(
                    width: 45,
                    height: 45,
                    margin: EdgeInsets.only(left: 1),
                    child: Center(
                      child: Icon(
                        Icons.downloading_outlined,
                        size: 29,
                      ),
                    ),
                  ),
                  BouncingButton(
                    onTap: () {
                      _bloc.add(SwitchStatusPlayerEvent());
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
                      child: Stack(
                        children: [
                          Center(
                            child: AnimatedIcon(
                              size: 45,
                              icon: _isPlaying == true
                                  ? AnimatedIcons.pause_play
                                  : AnimatedIcons.play_pause,
                              color: Colors.black,
                              progress: _iconController,
                            ),
                          ),
                          // SizedBox.expand(
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(
                          //       32,
                          //     ),
                          //     child: MaterialButton(
                          //       onPressed: () {
                          //         _bloc.add(SwitchStatusPlayerEvent());
                          //       },
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    margin: EdgeInsets.only(right: 1),
                    child: Center(
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/icons/icon_setting.png"),
                          ),
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
