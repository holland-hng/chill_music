import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'video_play_view.dart';

class VideoItemView extends StatelessWidget {
  final String? url;
  const VideoItemView({
    Key? key,
    this.url,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.music_note),
                  Text(
                    "Like My Father - Jax",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                "Em muốn về nhà với những đoá hồng trên tay  ❤️",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        VideoPlayView(
          url: url,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 4, right: 14),
                    width: 36,
                    height: 40,
                    child: Icon(CupertinoIcons.bookmark),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "85.196 lượt xem",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "8.196 lượt thích | 1.036 lượt chia sẻ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
          height: 30,
        ),
      ],
    );
  }
}
