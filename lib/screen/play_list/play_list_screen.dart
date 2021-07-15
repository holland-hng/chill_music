import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';

class PlayListScreen extends StatefulWidget {
  final PlaylistResponse? playlist;
  const PlayListScreen({Key? key, this.playlist}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState(playlist);
}

class _PlayListScreenState extends State<PlayListScreen> {
  final PlaylistResponse? playlist;
  final ScrollController _sliverScrollController = ScrollController();
  var _isPinned = false;
  var _isPlaying = false;

  _PlayListScreenState(this.playlist);

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
        body: PlayListBody(),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 1, bottom: 1),
        child: FloatingActionButton(
          backgroundColor: playlist?.color.mix(Colors.black, 0.4),
          onPressed: () {
            setState(() {
              _isPlaying = !_isPlaying;
            });
          },
          tooltip: 'Increment',
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ),
      // bottomNavigationBar: ShowUpAnimation(
      //   animationDuration: Duration(milliseconds: 0),
      //   child: MiniPlayView(),
      //   direction: Direction.vertical,
      // ),
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
