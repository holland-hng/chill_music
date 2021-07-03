import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class SongGradientView extends StatelessWidget {
  const SongGradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Application.size.width,
      height: Application.size.appBar! + 100,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            width: Application.size.width,
            height: Application.size.appBar! + 36,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
