import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class StreamingMusicView extends StatelessWidget {
  const StreamingMusicView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          width: Application.size.width! - 32,
          height: (Application.size.width! - 32) * 9 / 16,
          decoration: BoxDecoration(
            //color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: CachedNetworkImage(
              fadeInDuration: Duration(seconds: 0),
              imageUrl: "http://i3.ytimg.com/vi/igCr_QJ2c4o/maxresdefault.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          width: Application.size.width! - 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Những Bài Hát Lofi Tiếng Anh Cực Chill Hot Nhất Trên TikTok | Best English Lofi TikTok Songs",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "349.164 lượt xem | Đã phát trực tiếp vào 12 thg 6, 2021",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://yt3.ggpht.com/ytc/AKedOLTDbAK9kAeRLqJ1ZMW3tUOqcmuPeuX6CUZ4bFNBHQ=s48-c-k-c0x00ffffff-no-rj",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Musikrimix",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.check_circle,
                    size: 12,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
