import 'dart:ui';

import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/blur_background_view.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'song_cover_view.dart';

class ContentSongView extends StatelessWidget {
  const ContentSongView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            AppNavigator.pop(context);
          },
          icon: RotationTransition(
            turns: AlwaysStoppedAnimation(270 / 360),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: Application.size.appBar,
                    ),
                    SongCoverView(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28, right: 28, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Những Bài Hát Lofi Tiếng Anh Cực Chill Hot Nhất Trên TikTok | Best English Lofi TikTok Songs",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                "Musikrimix",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Application.colors.ultraLightGrey,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.check_circle,
                                size: 13,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            width: Application.size.width,
            height: Application.size.appBar! + 300,
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                  width: Application.size.width,
                  height: Application.size.appBar! + 36,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
