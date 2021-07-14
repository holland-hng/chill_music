import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class SongCoverView extends StatelessWidget {
  const SongCoverView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Application.size.width! - 28 * 2,
      height: Application.size.width! - 28 * 2,
      margin: EdgeInsets.only(top: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Hero(
          tag:
              "https://d21maqdem88xkb.cloudfront.net/thumbnails/maxresdefault.jpg",
          child: CachedNetworkImage(
            fadeInDuration: Duration(seconds: 0),
            imageUrl:
                "https://d21maqdem88xkb.cloudfront.net/thumbnails/maxresdefault.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
