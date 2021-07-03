import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/backgound_view.dart';
import 'package:chill_music/core/widgets/blur_background_view.dart';
import 'package:chill_music/screen/home/home_screen.dart';
import 'package:chill_music/screen/libary/libary_screen.dart';
import 'package:chill_music/screen/search/search_screen.dart';
import 'package:chill_music/screen/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'new_tabbar_controller.dart';

class TabbarController extends StatefulWidget {
  const TabbarController({Key? key}) : super(key: key);
  @override
  _TabbarControllerState createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  _TabbarControllerState();
  Widget _homeScreen = NewTabbarController(
    screen: BackgroundView(
      screen: HomeScreen(),
    ),
  );

  SearchScreen _searchScreen = SearchScreen();
  //LibaryScreen _libaryScreen = LibaryScreen();
  SettingScreen _settingScreen = SettingScreen();
  CupertinoTabView? x;
  @override
  void initState() {
    x = CupertinoTabView(
      builder: (contex) {
        return _homeScreen;
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.white,
        backgroundColor: Application.colors.darkGrey,
        items: [
          _bottomBarItem(0),
          BottomNavigationBarItem(
            label: "Search",
            activeIcon: Icon(
              CupertinoIcons.search,
              color: CupertinoColors.white,
            ),
            icon: Icon(
              CupertinoIcons.search,
              color: CupertinoColors.inactiveGray,
            ),
          ),
          BottomNavigationBarItem(
            label: "Libary",
            activeIcon: Icon(
              Icons.folder,
              color: CupertinoColors.white,
            ),
            icon: Icon(
              Icons.folder,
              color: CupertinoColors.inactiveGray,
            ),
          ),
          BottomNavigationBarItem(
            label: "Premium",
            activeIcon: Icon(
              CupertinoIcons.headphones,
              color: CupertinoColors.white,
            ),
            icon: Icon(
              CupertinoIcons.headphones,
              color: CupertinoColors.inactiveGray,
            ),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return x!;
      },
    );
  }

  BottomNavigationBarItem _bottomBarItem(
    int index,
  ) {
    String _label = "";
    String _activeIcon = "";
    String _normalIcon = "";
    switch (index) {
      case 0:
        _activeIcon = "assets/icons/icon_home_active.png";
        _label = "Home";
        _normalIcon = "assets/icons/icon_home.png";
        break;
      default:
    }
    return BottomNavigationBarItem(
      backgroundColor: Colors.red,
      label: _label,
      activeIcon: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(_activeIcon),
          ),
        ),
      ),
      icon: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(_normalIcon),
          ),
        ),
      ),
    );
  }
}
