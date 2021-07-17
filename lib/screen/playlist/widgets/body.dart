import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/home/widgets/mini_song_view.dart';
import 'package:chill_music/screen/playlist/bloc/playlist_bloc.dart';
import 'package:chill_music/screen/playlist/widgets/publisher_intro_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_list_view/group_list_view.dart';
import 'author_linking_view.dart';
import 'header_view.dart';

class PlayListBody extends StatelessWidget {
  final PlaylistResponse? playlist;
  const PlayListBody({
    Key? key,
    this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayListBloc, PlaylistState>(
        builder: (context, state) {
          var _authors = state.playlistDetails?[playlist?.id]?.authors ?? [];
          var _tracks = state.playlistDetails?[playlist?.id]?.tracks ?? [];
          var _isHasTracllist = _tracks.length != 0;
          Map<String, List> _elements = {
            'publisher': [],
            'tracks': _tracks,
            'authors': _authors,
          };

          return Container(
            height: Application.size.height! - Application.size.appBar!,
            color: Application.colors.backgroundColor,
            child: GroupListView(
              padding: const EdgeInsets.only(top: 0),
              sectionsCount: _elements.keys.toList().length,
              countOfItemInSection: (int section) {
                switch (section) {
                  case 0:
                  case 1:
                    return _elements.values.toList()[section].length;

                  default:
                    return 1;
                }
              },
              itemBuilder: (BuildContext context, IndexPath index) {
                switch (index.section) {
                  case 0:
                    return SizedBox();
                  case 1:
                    return MiniSongView(
                      key: ObjectKey(_tracks[index.index].thumbnail ?? ""),
                      track: _tracks[index.index],
                    );
                  case 2:
                    List<Widget> _authorItem = [];
                    for (int i = 0; i < _authors.length; i++) {
                      _authorItem.add(
                        AuthorLinkingView(
                            playlist: playlist, authors: _authors, i: i),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 8,
                          left: 16,
                          right: 16,
                          bottom: Application.size.appBar!),
                      child: Wrap(
                        runSpacing: 8,
                        children: _authorItem,
                      ),
                    );
                  default:
                    return SizedBox();
                }
              },
              groupHeaderBuilder: (BuildContext context, int section) {
                switch (section) {
                  case 0:
                    return PublisherIntroView();
                  case 1:
                    return HeaderView(
                      title: "Tracklist",
                    );
                  case 2:
                    return HeaderView(
                      title: "Support the beatmakers ",
                    );
                  default:
                    return SizedBox();
                }
              },
            ),
          );
        },
        buildWhen: (_, state) {
          var _needBuild = state.playlistDetails?[playlist?.id] != null;
          return _needBuild;
        },
        listener: (context, state) {});
  }
}
