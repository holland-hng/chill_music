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
  List<String> urls = [
    "https://cdn.tingtong.xyz/2021/07/03/122288436_962508277873841_2814926072344600163_n-d1b68db109c.mp4",
    "https://cdn.tingtong.xyz/2021/07/04/47405676_520611762472181_354490764357752369_n-a2582f226e.mp4",
    "https://cdn.tingtong.xyz/2021/07/04/10000000_2950538175265596_3656693907753086047_n-39ccb34fe2.mp4",
  ];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 4,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Column(
                children: [
                  TitleView(
                    title: "Music Video",
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            default:
              return VideoItemView(
                //key: keys[index - 1],
                url: urls[index - 1],
              );
          }
        },
      ),
      onNotification: (notification) {
        //print(_scrollController.position.pixels);
        //_getOffset(keys[0]);
        return true;
      },
    );
  }

  void _getOffset(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    if (position.dy < -(Application.size.width! / 2 + 10)) {
      print("deactive");
    }
  }

  List<GlobalKey> keys = [GlobalKey(), GlobalKey(), GlobalKey()];
}
