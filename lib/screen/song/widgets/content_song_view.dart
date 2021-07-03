import 'package:chill_music/core/player/provider_player.dart';
import 'package:chill_music/core/player/seek_bar.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'song_appbar_view.dart';
import 'song_cover_view.dart';
import 'song_gradient_view.dart';
import 'song_name_view.dart';

class ContentSongView extends StatefulWidget {
  const ContentSongView({Key? key}) : super(key: key);

  @override
  _ContentSongViewState createState() => _ContentSongViewState();
}

class _ContentSongViewState extends State<ContentSongView> {
  AudioPlayer? _player;
  bool _isPlaying = false;
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _init() async {
    _player = await ProviderPlayer.get(
        url: "https://luan.xyz/files/audio/ambient_c_motion.mp3");
    if (_player != null) {
      setState(() {
        _isPlaying = true;
      });
      _player?.play();
    } else {
      //will do something
    }
  }

  Stream<PositionData>? get _positionDataStream {
    if (_player == null) {
      return null;
    }
    return Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player!.positionStream,
        _player!.bufferedPositionStream,
        _player!.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position, bufferedPosition, duration ?? Duration.zero));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SongAppbarView(),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: Application.size.appBar,
                    ),
                    SongCoverView(),
                    SongNameView(),
                    StreamBuilder<PositionData>(
                      stream: _positionDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        return SeekBar(
                          duration: positionData?.duration ?? Duration.zero,
                          position: positionData?.position ?? Duration.zero,
                          bufferedPosition:
                              positionData?.bufferedPosition ?? Duration.zero,
                          onChangeEnd: _player?.seek,
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
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(_isPlaying
                                              ? "assets/icons/icon_pause.png"
                                              : "assets/icons/icon_play.png"),
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
                                            _player?.play();
                                          } else {
                                            _player?.pause();
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28, right: 28, top: 28),
                      child: Text(
                        "* Chỉ đơn giản rằng #Musikrimix chia sẻ các bài hát mà có thể bạn chưa bao giờ được nghe.\n* Nhận phát hành các bản lo-fi, Indie, nhạc chill... chỉ cần phù hợp với channel là Support liền ^^\n📢 Nếu có bất cứ thắc mắc, khiếu nại nào về bản quyền hình ảnh cũng như âm nhạc có trong video mong chủ sở hữu liên hệ trực tiếp qua thông tin bên dưới.\n\nSimply that I shared a music that you might never ever listen. If there is a copyright complaint in the video, please contact the owner directly via email.\n💌 picartvn123@gmail.com 💌\nAll Rights Reserved © - Musikrimix",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SongGradientView()
        ],
      ),
    );
  }
}
