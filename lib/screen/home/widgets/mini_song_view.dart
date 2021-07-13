import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class MiniSongView extends StatelessWidget {
  const MiniSongView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            width: 47,
            height: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
                  Border.all(width: 0.3, color: Colors.grey.withOpacity(0.3)),
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
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 5,
            ),
            width: Application.size.width! - 47 - 16 - 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bert - offline 💻 [lofi hip hop/relaxing beats]",
                  //"Bert - offline",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Lofi Girl",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 7, bottom: 14),
            width: 45,
            child: Text(
              "...",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
