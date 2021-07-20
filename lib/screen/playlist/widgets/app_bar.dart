import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter/material.dart';

class PlayListAppBar extends StatelessWidget {
  final PlaylistResponse? playlist;
  final String? heroTag;
  const PlayListAppBar({
    Key? key,
    required this.isPinned,
    this.playlist,
    this.heroTag,
  }) : super(key: key);

  final bool isPinned;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: isPinned
          ? playlist?.color.mix(Colors.black, 0.3)
          : Colors.transparent,
      shadowColor: Colors.transparent,
      expandedHeight: Application.size.width! + Application.size.appBar! - 100,
      stretch: true,
      pinned: true,
      floating: false,
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            playlist?.title ?? "",
            style: TextStyle(
                color: isPinned ? Colors.white : Colors.transparent,
                fontSize: 17,
                fontWeight: FontWeight.w600),
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
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: _ThumbnailPlaylistView(
                    playlist: playlist,
                    heroTag: heroTag,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class _ThumbnailPlaylistView extends StatefulWidget {
  final PlaylistResponse? playlist;
  final String? heroTag;
  const _ThumbnailPlaylistView({
    Key? key,
    required this.playlist,
    this.heroTag,
  }) : super(key: key);

  @override
  _ThumbnailPlaylistViewState createState() =>
      _ThumbnailPlaylistViewState(playlist, heroTag);
}

class _ThumbnailPlaylistViewState extends State<_ThumbnailPlaylistView> {
  final PlaylistResponse? playlist;
  final String? heroTag;
  late String _heroTag;

  _ThumbnailPlaylistViewState(this.playlist, this.heroTag);

  @override
  void initState() {
    _heroTag = heroTag ?? "";
    _handleChangeHeroTag();
    super.initState();
  }

  void _handleChangeHeroTag() {
    if (heroTag?.contains("chill-music-mini") == false) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _heroTag = "chill-music-mini-$_heroTag";
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _heroTag,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        fadeInDuration: Duration(seconds: 0),
        imageUrl: playlist?.thumbnail ?? "",
      ),
    );
  }
}
