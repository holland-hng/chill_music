import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MixIntroView extends StatelessWidget {
  final PlaylistResponse playlist;
  const MixIntroView({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Application.size.width,
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  playlist.title ?? "",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
          ),
          // BouncingAmazingButton(
          //   child: Container(
          //     margin: EdgeInsets.only(right: 10),
          //     width: 50,
          //     height: 45,
          //     color: Colors.transparent,
          //     child: SizedBox.expand(
          //       child: LikeButton(
          //         isLiked: true,
          //         circleColor:
          //             CircleColor(start: playlist.color, end: playlist.color),
          //         bubblesColor: BubblesColor(
          //           dotPrimaryColor: playlist.color,
          //           dotSecondaryColor: playlist.color,
          //         ),
          //         // onTap: () {
          //         //   if (context.read<AuthBloc>().isAuthValid) {
          //         //     //do something
          //         //   } else {}
          //         // },
          //         likeBuilder: (isLike) {
          //           return Icon(
          //             isLike ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          //             color: isLike ? playlist.color : Colors.white,
          //             size: 26,
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
