import 'package:chewie/chewie.dart';
import 'package:chill_music/core/tools/app_circle_loadting.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'desktop_control.dart';

class VideoPlayView extends StatefulWidget {
  final String? url;
  const VideoPlayView({Key? key, this.url}) : super(key: key);

  @override
  _VideoPlayViewState createState() => _VideoPlayViewState(url);
}

class _VideoPlayViewState extends State<VideoPlayView> {
  final String? url;
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isPlaying = false;

  _VideoPlayViewState(this.url);
  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void dispose() {
    _videoPlayerController?.pause();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    if (CacheController.players[url!] == null) {
      _videoPlayerController = VideoPlayerController.network(
        url!,
      );
      await _videoPlayerController?.initialize();
      _videoPlayerController?.play();
      CacheController.players[url!] = _videoPlayerController;
    } else {
      _videoPlayerController = CacheController.players[url!];
    }

    setState(() {
      _chewieController = ChewieController(
        showOptions: false,
        allowFullScreen: false,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        customControls: MaterialDesktopControls(),
        videoPlayerController: _videoPlayerController!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _videoPlayerController!.value.aspectRatio,
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: _chewieController != null
            ? Chewie(
                controller: _chewieController!,
              )
            : AppCircleLoading(),
      ),
    );
  }
}

class CacheController {
  static Map<String, VideoPlayerController?> players =
      Map<String, VideoPlayerController?>();

  static Future<void> cache(List<String> urls) async {
    for (int i = 0; i < urls.length; i++) {
      String url = urls[i];
      var _videoPlayerController = VideoPlayerController.network(
        url,
      );
      await _videoPlayerController.initialize();
      players[url] = _videoPlayerController;
    }
  }

  static VideoPlayerController? getPlayer(String url) {
    while (players[url] == null) {
      print("a");
    }
    return players[url]!;
  }
}
