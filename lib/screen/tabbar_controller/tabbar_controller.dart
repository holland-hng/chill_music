import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/backgound_view.dart';
import 'package:chill_music/screen/home/home_screen.dart';
import 'package:chill_music/screen/tabbar_controller/widgets/bottom_tabbar.dart';
import 'package:flutter/material.dart';

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
          screen: HomeScreen(),
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
