import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class PlayListBody extends StatelessWidget {
  const PlayListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Application.size.height! - Application.size.appBar!,
      color: Application.colors.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
            ),
            Container(
              height: 500,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
