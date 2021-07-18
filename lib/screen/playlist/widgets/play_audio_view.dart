import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class PlayAudioView extends StatefulWidget {
  const PlayAudioView({Key? key}) : super(key: key);

  @override
  _PlayAudioViewState createState() => _PlayAudioViewState();
}

class _PlayAudioViewState extends State<PlayAudioView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.red,
    );
  }
}
