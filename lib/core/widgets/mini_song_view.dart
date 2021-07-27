import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/track/track_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MiniSongView extends StatelessWidget {
  final TrackEntity? track;
  const MiniSongView({
    Key? key,
    this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: () {
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: "Seek to: ${track?.name ?? " "}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
        context
            .read<PlayerBloc>()
            .add(SeekToTimelineEvent(timeline: track?.timeline ?? ""));
      },
      child: Container(
        width: Application.size.width,
        height: 63,
        color: Colors.transparent,
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
                color: Application.colors.darkGrey,
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.all(width: 0.3, color: Colors.grey.withOpacity(0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 300),
                  fadeOutDuration: Duration(seconds: 1),
                  imageUrl: track?.thumbnail ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 5,
              ),
              width: Application.size.width - 47 - 16 - 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    track?.name ?? "",
                    //"Bert - offline",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (track?.author != null)
                    SizedBox(
                      height: 3,
                    ),
                  if (track?.author != null)
                    Text(
                      track?.author ?? "",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 11),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    track?.timeline ?? "",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
