import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayView extends StatefulWidget {
  const VideoPlayView({Key? key}) : super(key: key);

  @override
  _VideoPlayViewState createState() => _VideoPlayViewState();
}

class _VideoPlayViewState extends State<VideoPlayView> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isPlaying = false;
  @override
  void initState() {
    _initializePlayer();
    super.initState();
  }

  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        'https://cdn.tingtong.xyz/2021/07/03/122288436_962508277873841_2814926072344600163_n-d1b68db109c.mp4');
    await _videoPlayerController?.initialize();

    setState(() {
      _chewieController = ChewieController(
        showOptions: false,
        allowFullScreen: false,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        customControls: MaterialControls(),
        videoPlayerController: _videoPlayerController!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _videoPlayerController!.value.aspectRatio,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: _chewieController != null
                ? Chewie(
                    controller: _chewieController!,
                  )
                : SizedBox(),
          ),
          if (!_isPlaying)
            Container(
              width: 414,
              height: 414,
              child: CachedNetworkImage(
                imageUrl: "http://i3.ytimg.com/vi/RggLb0-pQW4/hqdefault.jpg",
                fit: BoxFit.cover,
              ),
            ),
          if (!_isPlaying)
            Center(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    35,
                  ),
                  color: Colors.black.withOpacity(0.45),
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: 31,
                ),
              ),
            ),
          if (!_isPlaying)
            SizedBox.expand(
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                  _chewieController?.play();
                },
              ),
            ),
        ],
      ),
    );
  }
}
