import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:flutter/material.dart';

class SongAppbarView extends PreferredSize {
  SongAppbarView()
      : super(
            child: Container(), preferredSize: Size.fromHeight(kToolbarHeight));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(""),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          AppNavigator.pop(context);
        },
        icon: RotationTransition(
          turns: AlwaysStoppedAnimation(270 / 360),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
