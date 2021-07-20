import 'package:chill_music/core/player/widgets/mini_play_view.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class BackgroundView extends StatefulWidget {
  final Widget? screen;

  const BackgroundView({Key? key, @required this.screen}) : super(key: key);

  @override
  _BackgroundViewState createState() => _BackgroundViewState(screen!);
}

class _BackgroundViewState extends State<BackgroundView> {
  final Widget screen;

  _BackgroundViewState(this.screen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Application.colors.backgroundColor,
        body: screen,
        bottomNavigationBar: MiniPlayView());
  }
}
