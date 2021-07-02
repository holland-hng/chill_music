import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/song/song_screen.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MiniPlayView extends StatelessWidget {
  const MiniPlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MiniPlayView();
  }
}

class _MiniPlayView extends StatefulWidget {
  const _MiniPlayView({Key? key}) : super(key: key);

  @override
  _MiniPlayViewState createState() => _MiniPlayViewState();
}

class _MiniPlayViewState extends State<_MiniPlayView> {
  double? _widthImage;
  double? _widthContent;

  @override
  void initState() {
    _widthImage = 60;
    _widthContent = Application.size.width! - _widthImage! - 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(Application.context).push(
          new PageRouteBuilder(
            opaque: false,
            barrierDismissible: true,
            pageBuilder: (BuildContext context, _, __) {
              return SongScreen();
            },
          ),
        );
      },
      child: Container(
        width: Application.size.width,
        height: 62.1,
        child: Column(
          children: [
            Container(
              height: 2,
              color: Application.colors.mediumGrey,
            ),
            Container(
              height: 60,
              color: Application.colors.darkGrey,
              child: Row(
                children: [
                  Container(
                    width: _widthImage,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          width: 60,
                          height: 60,
                          fadeInDuration: Duration(seconds: 0),
                          imageUrl:
                              "http://i3.ytimg.com/vi/igCr_QJ2c4o/maxresdefault.jpg",
                          fit: BoxFit.cover,
                        ),
                        Hero(
                          tag:
                              "http://i3.ytimg.com/vi/igCr_QJ2c4o/maxresdefault.jpg",
                          child: CachedNetworkImage(
                            width: 60,
                            height: 60,
                            fadeInDuration: Duration(seconds: 0),
                            imageUrl:
                                "http://i3.ytimg.com/vi/igCr_QJ2c4o/maxresdefault.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: _widthContent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 15,
                          width: _widthContent,
                          child: Marquee(
                            text:
                                'Những Bài Hát Lofi Tiếng Anh Cực Chill Hot Nhất Trên TikTok | Best English Lofi TikTok Songs',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 40.0,
                            velocity: 30,
                            pauseAfterRound: Duration(seconds: 2),
                            startPadding: 0,
                            accelerationDuration: Duration(seconds: 5),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Musikrimix",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w100),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 50,
                      child: statusPlayeIcon,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 0.1,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget statusPlayeIcon = Icon(Icons.play_arrow);
}
