import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class NewTabbarController extends StatefulWidget {
  final Widget? screen;

  const NewTabbarController({Key? key, @required this.screen})
      : super(key: key);

  @override
  _NewTabbarControllerState createState() => _NewTabbarControllerState(screen!);
}

class _NewTabbarControllerState extends State<NewTabbarController> {
  final Widget screen;

  _NewTabbarControllerState(this.screen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Application.colors.backgroundColor,
        body: screen,
        bottomNavigationBar: Container(
          width: Application.size.width,
          height: 50,
          color: Application.colors.darkGrey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _BottomTabbar(),
              Expanded(
                flex: 1,
                child: Column(
                  children: [],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ));
  }
}

class _BottomTabbar extends StatelessWidget {
  const _BottomTabbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/icons/icon_home_active.png"),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Home",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
