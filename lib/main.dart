import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency/init_config.dart';
import 'screen/home/bloc/home_bloc.dart';
import 'screen/tabbar_controller/tabbar_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => getIt(),
        ),
        BlocProvider<PlayListBloc>(
          create: (BuildContext context) => getIt(),
        ),
        BlocProvider<PlayerBloc>(
          create: (BuildContext context) => getIt(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF-Pro-Text',
          primaryColor: Colors.white,
          brightness: Brightness.dark,
        ),
        home: RootController(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}

class RootController extends StatefulWidget {
  const RootController({Key? key}) : super(key: key);
  @override
  _RootControllerState createState() => _RootControllerState();
}

class _RootControllerState extends State<RootController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Application.setContext(context);
    return TabbarController(
      key: ObjectKey("TabbarController"),
    );
  }
}
