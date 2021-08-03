import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/player/widgets/mini_play_view.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackgroundView extends StatefulWidget {
  final Widget? screen;

  const BackgroundView({Key? key, @required this.screen}) : super(key: key);

  @override
  _BackgroundViewState createState() => _BackgroundViewState(screen!);
}

class _BackgroundViewState extends State<BackgroundView>
    with WidgetsBindingObserver {
  final Widget screen;
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  late AppLifecycleState _notification;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<PlayerBloc>().add(FetchPlayerStatusEvent());
    }
  }

  _BackgroundViewState(this.screen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Application.colors.backgroundColor,
      body: screen,
      bottomNavigationBar: MiniPlayView(),
    );
  }
}
