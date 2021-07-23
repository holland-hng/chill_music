import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/core/widgets/gradient_background_view.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:chill_music/screen/playlist/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPlaylistItemView extends StatefulWidget {
  final PlaylistResponse playlist;
  const NewPlaylistItemView({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  _NewPlaylistItemViewState createState() =>
      _NewPlaylistItemViewState(playlist);
}

class _NewPlaylistItemViewState extends State<NewPlaylistItemView> {
  final PlaylistResponse playlist;
  _NewPlaylistItemViewState(this.playlist);

  @override
  void initState() {
    context.read<PlayListBloc>().add(FetchPlaylistContent(playlist.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: () {
        AppNavigator.push(
          context,
          GradientBackgroundView(
            colors: [
              playlist.color,
              Application.colors.backgroundColor!.withAlpha(50),
              Application.colors.backgroundColor!,
            ],
            contentView: PlaylistScreen(
              playlist: playlist,
              heroTag: playlist.thumbnail,
            ),
          ),
        );
      },
      child: Container(
        width: (Application.size.width! - 22 * 2 - 15) / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: (Application.size.width! - 22 * 2 - 15) / 2,
              height: (Application.size.width! - 22 * 2 - 15) / 2,
              decoration: BoxDecoration(
                color: Application.colors.darkGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: playlist.thumbnail ?? "",
                  child: CachedNetworkImage(
                    imageUrl: playlist.thumbnail!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              playlist.title ?? "Title",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              playlist.publisher?.name ?? "Author",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
