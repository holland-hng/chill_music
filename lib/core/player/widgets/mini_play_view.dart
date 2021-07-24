import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/gradient_background_view.dart';
import 'package:chill_music/screen/playlist/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class _MiniPlayViewState extends State<_MiniPlayView>
    with SingleTickerProviderStateMixin {
  double? _widthImage;
  double? _widthContent;
  late bool _isPlaying;
  AnimationController? _iconController;
  double get _maxHeight {
    return 62;
  }

  double _height = 62 + Application.size.tabBar;

  @override
  void initState() {
    _widthImage = 60;
    _widthContent = Application.size.width - _widthImage! - 104; //92;
    _iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _isPlaying = context.read<PlayerBloc>().state.player?.playing ?? false;
    super.initState();
  }

  @override
  void dispose() {
    // implement dispose
    _iconController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerBloc, PlayerState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          if (state.playlist != null) {
            AppNavigator.push(
              context,
              GradientBackgroundView(
                colors: [
                  state.playlist!.color,
                  Application.colors.backgroundColor.withAlpha(50),
                  Application.colors.backgroundColor,
                ],
                contentView: PlaylistScreen(
                  playlist: state.playlist,
                  heroTag: "chill-music-mini-${state.playlist?.thumbnail}",
                ),
              ),
            );
          }
        },
        child: state.playlist == null
            ? SizedBox()
            : AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: Application.size.width,
                height: _height,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("do nothing");
                        },
                        child: Container(
                          height: 2,
                          color: Application.colors.mediumGrey,
                          child: StreamBuilder<Duration>(
                            stream: state.player?.positionStream,
                            builder: (context, snapshot) {
                              final positionData = snapshot.data;
                              double _alpha = (positionData?.inSeconds ?? 0) /
                                  (state.player?.duration?.inSeconds ?? 1);

                              return Row(
                                children: [
                                  Container(
                                    width: _alpha * Application.size.width,
                                    height: 2,
                                    color: Colors.white,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        color: Application.colors.darkGrey,
                        child: Row(
                          children: [
                            Container(
                              width: _widthImage,
                              padding: const EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      width: 60 * 16 / 9,
                                      height: 60,
                                      fadeInDuration: Duration(seconds: 0),
                                      imageUrl: state.playlist?.thumbnail ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Hero(
                                    tag:
                                        "chill-music-mini-${state.playlist?.thumbnail}",
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: CachedNetworkImage(
                                        width: 60 * 16 / 9,
                                        height: 60,
                                        fadeInDuration: Duration(seconds: 0),
                                        imageUrl:
                                            state.playlist?.thumbnail ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: _widthContent,
                              padding: const EdgeInsets.only(left: 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.playlist?.title ?? "",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    state.playlist?.publisher?.name ?? "",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<PlayerBloc>()
                                    .add(SwitchStatusPlayerEvent());
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 8),
                                width: 52,
                                height: 60,
                                child: Center(
                                  child: AnimatedIcon(
                                    icon: AnimatedIcons.pause_play,
                                    size: 30,
                                    progress: _iconController!,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("asdsd");
                              },
                              child: Container(
                                padding: const EdgeInsets.only(right: 8),
                                width: 52,
                                height: 60,
                                child: Center(
                                  child: Icon(
                                    Icons.skip_next,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: Application.size.tabBar,
                        color: Application.colors.darkGrey,
                      )
                    ],
                  ),
                ),
              ),
      );
    }, listener: (context, state) {
      if (state.player?.playing == true) {
        _iconController?.reverse();
      } else {
        _iconController?.forward();
      }
    });
  }
}
