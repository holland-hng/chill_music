import 'package:chill_music/core/player/bloc/provider_player.dart';
import 'package:chill_music/core/player/widgets/seek_bar.dart';
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
  static BuildContext? _context;
  AudioPlayer? _player;
  bool _isPlaying = false;
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _ContentSongViewState._context = null;
    super.dispose();
  }

//https://d21maqdem88xkb.cloudfront.net/audios/%5BONTIVA.COM%5D+Amess+-+A+place+above+heaven+%F0%9F%8C%85+%5Blofi+hip+hop_relaxing+beats%5D-320k.mp3
  Future<void> _init() async {
    _player = await ProviderPlayer.get(
        url: //https://d21maqdem88xkb.cloudfront.net/audios/%5BONTIVA.COM%5D+Amess+-+A+place+above+heaven+%F0%9F%8C%85+%5Blofi+hip+hop_relaxing+beats%5D-320k.mp3
            //https://firebasestorage.googleapis.com/v0/b/tingtong-fc736.appspot.com/o/1.%20Leicester%20Square%20(feat.%20Socrab%20%26%20ticofaces)%20(M2).mp3?alt=media&token=4ec1119f-0c66-4740-b331-eb8c27e8d356
            "https://chillmusic.sgp1.digitaloceanspaces.com/audios/y2mate.com%20-%20Nhu%CC%9B%CC%83ng%20Ba%CC%80i%20Ha%CC%81t%20Lofi%20Acoustic%20Tie%CC%82%CC%81ng%20Anh%20Cu%CC%9B%CC%A3c%20Chill%20Hay%20Nha%CC%82%CC%81t%20%20Nha%CC%A3c%20Lofi%20Chill%20Tik%20Tok%20Nhe%CC%A3%20Nha%CC%80ng%20.mp3");
    if (_player != null) {
      if (_ContentSongViewState._context != null) {
        setState(() {
          _isPlaying = true;
        });
      }
      _player?.setVolume(1);
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
    _ContentSongViewState._context = context;
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
