import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';

class PlaylistScreen extends StatefulWidget {
  final PlaylistResponse? playlist;
  final String? heroTag;

  const PlaylistScreen({Key? key, this.playlist, this.heroTag})
      : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState(playlist, heroTag);
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final PlaylistResponse? playlist;
  final String? heroTag;
  final ScrollController _sliverScrollController = ScrollController();
  var _isPinned = false;

  _PlaylistScreenState(this.playlist, this.heroTag);

  @override
  void initState() {
    Application.setSubContext(
      context: context,
      screen: ScreenEnum.playlist,
    );
    _sliverScrollController.addListener(_handleScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    Application.setSubContext(
      context: null,
      screen: ScreenEnum.playlist,
    );
    _sliverScrollController.removeListener(_handleScrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        controller: _sliverScrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            PlayListAppBar(
              isPinned: _isPinned,
              playlist: playlist,
              heroTag: heroTag,
            ),
          ];
        },
        body: PlayListBody(
          playlist: playlist,
        ),
      ),
    );
  }

  void _handleScrollListener() {
    if (!_isPinned &&
        _sliverScrollController.hasClients &&
        _sliverScrollController.offset >
            (Application.size.width - Application.size.appBar - 35)) {
      setState(() {
        _isPinned = true;
      });
    } else if (_isPinned &&
        _sliverScrollController.hasClients &&
        _sliverScrollController.offset <
            (Application.size.width - Application.size.appBar - 35)) {
      setState(() {
        _isPinned = false;
      });
    }
  }
}
