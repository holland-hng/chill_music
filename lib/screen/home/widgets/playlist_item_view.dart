import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/gradient_background_view.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:chill_music/screen/playlist/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaylistItemView extends StatefulWidget {
  const PlaylistItemView({
    Key? key,
    required PlaylistResponse playlist,
  })  : _playlist = playlist,
        super(key: key);

  final PlaylistResponse _playlist;

  @override
  _PlaylistItemViewState createState() => _PlaylistItemViewState(_playlist);
}

class _PlaylistItemViewState extends State<PlaylistItemView> {
  final PlaylistResponse _playlist;

  _PlaylistItemViewState(this._playlist);

  @override
  void initState() {
    context.read<PlayListBloc>().add(FetchPlaylistContent(_playlist.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: (Application.size.width! - 16 * 3) / 2.5,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (Application.size.width! - 16 * 3) / 2.5,
                height: (Application.size.width! - 16 * 3) / 2.5,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 0.3,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Hero(
                    tag: _playlist.thumbnail!,
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(seconds: 0),
                      imageUrl: _playlist.thumbnail!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                _playlist.title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (_playlist.publisher != null)
                SizedBox(
                  height: 2,
                ),
              if (_playlist.publisher != null)
                Text(
                  _playlist.publisher?.name ?? "Publisher",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
          SizedBox.expand(
            child: MaterialButton(
              onPressed: () {
                AppNavigator.push(
                  context,
                  GradientBackgroundView(
                    colors: [
                      //Color.fromARGB(255, 167, 207, 210),
                      _playlist.color,
                      Application.colors.backgroundColor!.withAlpha(50),
                      Application.colors.backgroundColor!,
                    ],
                    contentView: PlaylistScreen(
                      playlist: _playlist,
                      heroTag: _playlist.thumbnail,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
