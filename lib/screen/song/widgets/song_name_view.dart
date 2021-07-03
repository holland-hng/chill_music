import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class SongNameView extends StatelessWidget {
  const SongNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            child: Marquee(
              text:
                  'Những Bài Hát Lofi Tiếng Anh Cực Chill Hot Nhất Trên TikTok | Best English Lofi TikTok Songs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 40.0,
              velocity: 30,
              pauseAfterRound: Duration(seconds: 2),
              startPadding: 0,
              accelerationDuration: Duration(seconds: 5),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          // Text(
          //   "Những Bài Hát Lofi Tiếng Anh Cực Chill Hot Nhất Trên TikTok | Best English Lofi TikTok Songs",
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          //   textAlign: TextAlign.start,
          //   overflow: TextOverflow.ellipsis,
          //   maxLines: 1,
          // ),
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
    );
  }
}
