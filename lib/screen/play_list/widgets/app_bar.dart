import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter/material.dart';

class PlayListAppBar extends StatelessWidget {
  const PlayListAppBar({
    Key? key,
    required this.isPinned,
  }) : super(key: key);

  final bool isPinned;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: isPinned
          ? Color.fromARGB(255, 167, 207, 210).mix(Colors.black, 0.4)
          : Colors.transparent,
      shadowColor: Colors.transparent,
      expandedHeight: Application.size.width! + Application.size.statusBar!,
      stretch: true,
      pinned: true,
      floating: false,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            "Rain & Chill",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          background: Column(
            children: [
              SizedBox(
                height: Application.size.appBar,
              ),
              Container(
                width: Application.size.width! - 100,
                height: Application.size.width! - 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 45,
                      color: Colors.white.withOpacity(0.23),
                    ),
                  ],
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Hero(
                    tag:
                        "https://i.scdn.co/image/ab67706c0000bebbaaa87e17e5a9a7fe261fc08e",
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(seconds: 0),
                      imageUrl:
                          "https://i.scdn.co/image/ab67706c0000bebbaaa87e17e5a9a7fe261fc08e",
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
