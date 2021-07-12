import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/home/widgets/title_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/category_view.dart';
import 'widgets/streaming_music_view.dart';
import 'widgets/trending_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //backgroundColor: Application.colors.backgroundColor,
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return SizedBox(
                height: 0,
              );
              return Column(
                children: [
                  TitleView(
                    title: "Streaming Mix",
                    isAppbar: true,
                  ),
                  StreamingMusicView(),
                ],
              );
            case 1:
              return CategoryView();
            case 2:
              return TrendingView();

            default:
              return SizedBox(
                height: 500,
              );
          }
        },
      ),
    );
  }
}
