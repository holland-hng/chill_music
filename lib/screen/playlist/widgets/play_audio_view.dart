import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/player/widgets/seek_bar.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayAudioView extends StatefulWidget {
  final PlaylistDetailResponse playlist;
  const PlayAudioView({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlayAudioViewState createState() => _PlayAudioViewState(playlist);
}

class _PlayAudioViewState extends State<PlayAudioView> {
  final PlaylistDetailResponse playlist;
  late PlayerBloc _bloc;
  bool _isPlaying = false;

  _PlayAudioViewState(this.playlist);
  @override
  void initState() {
    _bloc = context.read<PlayerBloc>();
    _bloc.add(SwitchPlayerEvent(playlist: playlist));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<PositionData>(
          stream: _bloc.positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            return SeekBar(
              duration: positionData?.duration ?? Duration.zero,
              position: positionData?.position ?? Duration.zero,
              bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
              onChangeEnd: _bloc.player.seek,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.heart,
                  size: 26,
                ),
              ),
              Container(
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
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: _isPlaying
                            ? Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                        "assets/icons/icon_pause.png"),
                                  ),
                                ),
                              )
                            : Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                        "assets/icons/icon_play.png"),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox.expand(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          32,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              _isPlaying = !_isPlaying;
                              if (_isPlaying) {
                                _bloc.add(
                                    SwitchStatusPlayerEvent(isNeedPlay: true));
                              } else {
                                _bloc.add(
                                    SwitchStatusPlayerEvent(isNeedPlay: false));
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.share,
                    size: 26,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
