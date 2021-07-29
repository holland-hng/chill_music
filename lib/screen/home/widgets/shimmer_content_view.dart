import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'new_playlist_item_view.dart';

class ShimmerContentView extends StatelessWidget {
  const ShimmerContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Application.colors.darkGrey,
      highlightColor: Application.colors.mediumGrey,
      enabled: true,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          top: 24,
          left: 34,
          right: 34,
          bottom: 34,
        ),
        //itemCount: state.homePlaylists?.length ?? 0,
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          crossAxisSpacing: 34,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
        ),
        itemBuilder: (contetx, index) {
          return ShimmerPlaylistItemView();
        },
      ),
    );
  }
}
