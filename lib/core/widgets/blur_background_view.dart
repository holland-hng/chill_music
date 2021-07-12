import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../player/mini_play_view.dart';

class BlurBackgroundView extends StatefulWidget {
  final String? imageUrl;
  final Widget? screen;

  const BlurBackgroundView({Key? key, @required this.screen, this.imageUrl})
      : super(key: key);

  @override
  _BlurBackgroundViewState createState() =>
      _BlurBackgroundViewState(screen!, imageUrl!);
}

class _BlurBackgroundViewState extends State<BlurBackgroundView> {
  final String? imageUrl;
  final Widget screen;

  _BlurBackgroundViewState(this.screen, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SizedBox.expand(
          //   child: CachedNetworkImage(
          //     fadeInDuration: Duration(seconds: 0),
          //     imageUrl: imageUrl!,
          //     fit: BoxFit.fitHeight,
          //   ),
          // ),
          // SizedBox.expand(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: Container(
          //       color: Colors.black.withOpacity(0.2),
          //     ),
          //   ),
          // ),
          SizedBox.expand(
            child: Blur(
              blurColor: Colors.black,
              child: SizedBox.expand(
                child: CachedNetworkImage(
                  fadeInDuration: Duration(seconds: 0),
                  imageUrl: imageUrl!,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),

          screen,
        ],
      ),
      // bottomNavigationBar: ShowUpAnimation(
      //   animationDuration: Duration(milliseconds: 500),
      //   child: MiniPlayView(),
      //   direction: Direction.vertical,
      // ),
    );
  }
}
