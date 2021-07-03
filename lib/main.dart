import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/tabbar_controller/tabbar_controller.dart';
import 'package:audio_session/audio_session.dart';

Future<void> main() async {
  // final session = await AudioSession.instance;
  // await session.configure(AudioSessionConfiguration.music());
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chill Music',
      theme: ThemeData(
        fontFamily: 'SF-Pro-Text',
        primaryColor: Colors.white,
        brightness: Brightness.dark,
      ),
      home: RootController(),
    );
  }
}

class RootController extends StatefulWidget {
  @override
  _RootControllerState createState() => _RootControllerState();
}

class _RootControllerState extends State<RootController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Application.setContext(context);
    return TabbarController();
    //return BlurBackgroundView(screen: HomeScreen());
  }
}
