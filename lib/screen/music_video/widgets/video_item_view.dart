import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

import 'video_play_view.dart';

class VideoItemView extends StatelessWidget {
  const VideoItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 58,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "𝑭𝒂𝒍𝒍 𝑰𝒏 𝑳𝒖𝒗",
                      ),
                      Text(
                        "1-7-2021",
                        style: TextStyle(
                            fontSize: 12, color: Application.colors.lightGrey),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
        ),
        VideoPlayView(),
      ],
    );
  }
}
