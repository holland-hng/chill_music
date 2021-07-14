import 'package:chill_music/core/tools/application_context.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dependency/init_config.dart';
import 'screen/tabbar_controller/tabbar_controller.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
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
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
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
