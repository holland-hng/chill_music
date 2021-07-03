import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/backgound_view.dart';
import 'package:chill_music/screen/home/home_screen.dart';
import 'package:chill_music/screen/music_video/music_video.dart';
import 'package:chill_music/screen/tabbar_controller/widgets/bottom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

class TabbarController extends StatefulWidget {
  const TabbarController({Key? key}) : super(key: key);

  @override
  _TabbarControllerState createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Application.colors.backgroundColor,
        body: BackgroundView(
          screen: PreloadPageView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return HomeScreen();
                case 1:
                  return MusicVideoScreen();
                default:
                  return Container();
              }
            },
            onPageChanged: (int position) {},
            preloadPagesCount: 2,
            controller: PreloadPageController(),
          ),
        ),
        bottomNavigationBar: Container(
          width: Application.size.width,
          height: 50,
          color: Application.colors.darkGrey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(flex: 1, child: BottomTabbar(index: 0, isActive: true)),
              Expanded(flex: 1, child: BottomTabbar(index: 1)),
              Expanded(flex: 1, child: BottomTabbar(index: 2)),
              Expanded(flex: 1, child: BottomTabbar(index: 3)),
            ],
          ),
        ));
  }
}
