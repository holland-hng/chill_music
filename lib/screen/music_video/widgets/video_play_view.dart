import 'package:chewie/chewie.dart';
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
    _videoPlayerController = VideoPlayerController.network(url!);
    await _videoPlayerController?.initialize();

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
          // if (!_isPlaying)
          //   Container(
          //     width: Application.size.width,
          //     height: Application.size.width,
          //     child: CachedNetworkImage(
          //       imageUrl: "http://i3.ytimg.com/vi/RggLb0-pQW4/hqdefault.jpg",
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // if (!_isPlaying)
          //   Center(
          //     child: Container(
          //       width: 70,
          //       height: 70,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(
          //           35,
          //         ),
          //         color: Colors.black.withOpacity(0.45),
          //       ),
          //       child: Icon(
          //         Icons.play_arrow,
          //         size: 31,
          //       ),
          //     ),
          //   ),
          // if (!_isPlaying)
          //   SizedBox.expand(
          //     child: MaterialButton(
          //       onPressed: () {
          //         setState(() {
          //           _isPlaying = !_isPlaying;
          //         });
          //         _chewieController?.play();
          //       },
          //     ),
          //   ),
        ],
      ),
    );
  }
}
