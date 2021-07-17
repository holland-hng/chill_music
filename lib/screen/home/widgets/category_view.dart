import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/entity/category/category_response.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/material.dart';
import 'playlist_item_view.dart';
import 'title_view.dart';

class CategoryView extends StatefulWidget {
  final CategoryResponse? category;
  const CategoryView({Key? key, this.category}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState(category);
}

class _CategoryViewState extends State<CategoryView> {
  final CategoryResponse? category;
  _CategoryViewState(this.category);
  bool hasMultiline = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(
          title: category?.title,
        ),
        SizedBox(
          height: 13,
        ),
        SizedBox(
          height: (Application.size.width! - 16 * 3) / 2.5 + 45,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: category?.playlists?.length ?? 0,
            itemBuilder: (contetx, index) {
              PlaylistResponse _playlist = category!.playlists![index];
              return PlaylistItemView(playlist: _playlist);
            },
          ),
        ),
      ],
    );
  }
}
