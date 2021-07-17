import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';
import 'widgets/play_audio_view.dart';

class PlaylistScreen extends StatefulWidget {
  final PlaylistResponse? playlist;
  const PlaylistScreen({Key? key, this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState(playlist);
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final PlaylistResponse? playlist;
  final ScrollController _sliverScrollController = ScrollController();
  var _isPinned = false;
  var _isPlaying = false;

  _PlaylistScreenState(this.playlist);

  @override
  void initState() {
    _sliverScrollController.addListener(_handleScrollListener);
    super.initState();
  }

  @override
  void dispose() {
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
            ),
          ];
        },
        body: PlayListBody(
          playlist: playlist,
        ),
      ),
      bottomNavigationBar: PlayAudioView(),
    );
  }

  void _handleScrollListener() {
    if (!_isPinned &&
        _sliverScrollController.hasClients &&
        _sliverScrollController.offset >
            (Application.size.width! - Application.size.appBar!)) {
      setState(() {
        _isPinned = true;
      });
    } else if (_isPinned &&
        _sliverScrollController.hasClients &&
        _sliverScrollController.offset <
            (Application.size.width! - Application.size.appBar!)) {
      setState(() {
        _isPinned = false;
      });
    }
  }
}
