import 'package:chill_music/core/widgets/blur_gradient_background_view.dart';
import 'package:flutter/material.dart';

import 'widgets/content_song_view.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.down,
      key: const Key('SongScreen'),
      onDismissed: (_) => Navigator.of(context).pop(),
      child: BlurGradientBackgroundView(
        contentView: ContentSongView(),
      ),
    );
  }
}
