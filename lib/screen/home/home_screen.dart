import 'package:chill_music/screen/home/widgets/title_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/category_view.dart';
import 'widgets/streaming_music_view.dart';

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
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Column(
                children: [
                  TitleView(
                    title: "Trending Mix",
                    isAppbar: true,
                  ),
                  StreamingMusicView(),
                ],
              );
            case 1:
              return CategoryView();
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
