import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../player/mini_play_view.dart';

class BlurBackgroundView extends StatefulWidget {
  final Widget? screen;

  const BlurBackgroundView({Key? key, @required this.screen}) : super(key: key);

  @override
  _BlurBackgroundViewState createState() => _BlurBackgroundViewState(screen!);
}

class _BlurBackgroundViewState extends State<BlurBackgroundView> {
  final Widget screen;

  _BlurBackgroundViewState(this.screen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CachedNetworkImage(
              fadeInDuration: Duration(seconds: 0),
              imageUrl: "http://i3.ytimg.com/vi/igCr_QJ2c4o/maxresdefault.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox.expand(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          screen,
        ],
      ),
      bottomNavigationBar: ShowUpAnimation(
        animationDuration: Duration(milliseconds: 500),
        child: MiniPlayView(),
        direction: Direction.vertical,
      ),
    );
  }
}
