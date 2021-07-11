import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
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
        itemCount: 4,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
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
              return Column(
                children: [
                  TitleView(
                    title: "Trending Mix",
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              );

            case 3:
              return Container(
                  width: Application.size.width,
                  height: 63,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                        ),
                        width: 47 * 16 / 9,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(seconds: 0),
                            imageUrl:
                                "http://i3.ytimg.com/vi/ZBZBzTTCO94/maxresdefault.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 16),
                        width: Application.size.width! - 47 * 16 / 9 - 16,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bert - offline 💻 [lofi hip hop/relaxing beats]",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Lofi Girl",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
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
