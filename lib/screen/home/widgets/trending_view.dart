import 'package:flutter/material.dart';

import 'mini_song_view.dart';
import 'title_view.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(
          title: "Trending Mix",
        ),
        SizedBox(
          height: 16,
        ),
        MiniSongView(),
        MiniSongView(),
        MiniSongView(),
        MiniSongView(),
        MiniSongView(),
        MiniSongView(),
        MiniSongView(),
        MiniSongView(),
        MiniSongView(),
      ],
    );
  }
}
