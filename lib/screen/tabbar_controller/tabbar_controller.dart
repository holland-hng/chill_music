import 'package:audio_session/audio_session.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/backgound_view.dart';
import 'package:chill_music/screen/home/home_screen.dart';
import 'package:chill_music/screen/tabbar_controller/widgets/more_button.dart';
import 'package:chill_music/screen/tabbar_controller/bloc/tabbar_bloc.dart';
import 'package:chill_music/screen/tabbar_controller/widgets/bottom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'widgets/drawer_option_view.dart';

class TabbarController extends StatefulWidget {
  const TabbarController({Key? key}) : super(key: key);

  @override
  _TabbarControllerState createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {
  PreloadPageController _controller = PreloadPageController();
  GlobalKey<ScaffoldState> _tabbarKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    configSession();
    super.initState();
  }

  Future<void> configSession() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TabbarBloc, TabbarState>(
      listener: (context, state) {
        switch (state.typeChangePage) {
          case TabbarEventType.swipeToChangePage:
            break;
          case TabbarEventType.tabToChangePage:
            _controller.animateToPage(
              state.currentIndex!,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOutCirc,
            );
            //_controller.jumpToPage(state.currentIndex!);

            break;
          default:
        }
      },
      child: Scaffold(
        key: _tabbarKey,
        drawer: DrawerOptionView(),
        backgroundColor: Application.colors.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Application.colors.backgroundColor,
          elevation: 0,
          title: Text(
            "Chill Music",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          centerTitle: true,
          leading: MoreButton(
            onTap: () {
              _tabbarKey.currentState?.openDrawer();
              //print("asd");
            },
          ),
          actions: [
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.only(right: 10),
              child: Center(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/icons/icon_search.png"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: BackgroundView(
          screen: PreloadPageView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return HomeScreen();
                case 1:
                  return Scaffold(
                    backgroundColor: Colors.red,
                  );
                default:
                  return Scaffold(
                    backgroundColor: Colors.blue,
                  );
              }
            },
            onPageChanged: (int newIndex) {
              context.read<TabbarBloc>().add(SwipeToChangePageEvent(newIndex));
            },
            preloadPagesCount: 3,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
