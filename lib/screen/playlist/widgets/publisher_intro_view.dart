import 'package:chill_music/core/tools/application_context.dart';

import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublisherIntroView extends StatelessWidget {
  final PlaylistResponse playlist;
  const PublisherIntroView({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Application.size.width,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                playlist.title ?? "",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                playlist.publisher?.name ?? "",
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
