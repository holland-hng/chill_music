import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/core/widgets/mini_song_view.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TracklistView extends StatelessWidget {
  final PlaylistResponse? playlist;
  const TracklistView({
    Key? key,
    this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayListBloc, PlaylistState>(
        builder: (context, state) {
          //var _authors = state.playlistDetails?[playlist?.id]?.authors;
          var _tracks = state.playlistDetails?[playlist?.id]?.tracks ?? [];
          var _isHasTracllist = _tracks.length != 0;
          List<Widget> _trackItems = [];
          if (_isHasTracllist) {
            for (int i = 0; i < _tracks.length; i++) {
              _trackItems.add(MiniSongView(
                track: _tracks[i],
              ));
            }
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              if (_isHasTracllist)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Tracklist",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              if (_isHasTracllist)
                SizedBox(
                  height: 8,
                ),
              if (_isHasTracllist) ..._trackItems
            ],
          );
        },
        buildWhen: (_, state) {
          var _needBuild = state.playlistDetails?[playlist?.id] != null;
          return _needBuild;
        },
        listener: (context, state) {});
  }
}
