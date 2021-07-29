import 'package:audio_session/audio_session.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/backgound_view.dart';
import 'package:chill_music/screen/home/home_screen.dart';
import 'package:chill_music/screen/library/library_screen.dart';
import 'package:chill_music/screen/search/search_screen.dart';
import 'package:chill_music/screen/tabbar_controller/bloc/tabbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'widgets/bottom_tabbar.dart';

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
        //drawer: DrawerOptionView(),
        backgroundColor: Application.colors.backgroundColor,
        body: BackgroundView(
          screen: PreloadPageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return HomeScreen();
                case 1:
                  return SearchScreen();
                case 2:
                  return LibraryScreen();
                default:
                  return SizedBox();
              }
            },
            onPageChanged: (int newIndex) {
              context.read<TabbarBloc>().add(SwipeToChangePageEvent(newIndex));
            },
            preloadPagesCount: 3,
            controller: _controller,
          ),
        ),
        bottomNavigationBar: Container(
          width: Application.size.width,
          height: 50.1 + Application.size.tabBar,
          color: Application.colors.darkGrey,
          child: Column(
            children: [
              Container(
                height: 0.1,
                color: Colors.white,
              ),
              Container(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1, child: BottomTabbar(index: 0, isActive: true)),
                    Expanded(flex: 1, child: BottomTabbar(index: 1)),
                    Expanded(flex: 1, child: BottomTabbar(index: 2)),
                    Expanded(flex: 1, child: BottomTabbar(index: 3)),
                  ],
                ),
              ),
              Container(
                height: Application.size.tabBar,
              )
            ],
          ),
        ),
      ),
    );
  }
}
