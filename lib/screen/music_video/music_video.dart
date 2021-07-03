import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/home/widgets/title_view.dart';
import 'package:flutter/material.dart';

import 'widgets/video_item_view.dart';

class MusicVideoScreen extends StatefulWidget {
  const MusicVideoScreen({Key? key}) : super(key: key);

  @override
  _MusicVideoScreenState createState() => _MusicVideoScreenState();
}

class _MusicVideoScreenState extends State<MusicVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Column(
              children: [
                TitleView(
                  title: "Music Video",
                ),
              ],
            );
          default:
            return VideoItemView();
        }
      },
    );
  }
}
