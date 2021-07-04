import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'video_play_view.dart';

class VideoItemView extends StatelessWidget {
  const VideoItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 36,
                    height: 36,
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "2 tháng 7 lúc 18:31",
                        style: TextStyle(
                            fontSize: 13, color: Application.colors.lightGrey),
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Text(
            "Em muốn về nhà với những đoá hồng trên tay  ❤️",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        VideoPlayView(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 36,
                        height: 40,
                        child: Icon(
                          CupertinoIcons.heart,
                          size: 25,
                        ),
                      ),
                      Container(
                        width: 36,
                        height: 40,
                        child: Icon(CupertinoIcons.chat_bubble),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 4),
                        width: 36,
                        height: 40,
                        child: Icon(CupertinoIcons.share),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "8.196 lượt thích",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Xem tất cả 75 bình luận",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Application.colors.lightGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
