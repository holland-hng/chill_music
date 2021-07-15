import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/blur_background_view.dart';
import 'package:chill_music/core/widgets/gradient_background_view.dart';
import 'package:chill_music/entity/category/category_response.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:chill_music/screen/play_list/play_list_screen.dart';
import 'package:chill_music/screen/tabbar_controller/tabbar_controller.dart';
import 'package:flutter/material.dart';

import 'title_view.dart';

class CategoryView extends StatelessWidget {
  final CategoryResponse? category;
  const CategoryView({
    Key? key,
    this.category,
  }) : super(key: key);

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
          height: (Application.size.width! - 16 * 3) / 2.5 + 36,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: category?.playlists?.length ?? 0,
            itemBuilder: (contetx, index) {
              PlaylistResponse _playlist = category!.playlists![index];
              return Container(
                margin: EdgeInsets.only(right: 16),
                width: (Application.size.width! - 16 * 3) / 2.5,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: (Application.size.width! - 16 * 3) / 2.5,
                          height: (Application.size.width! - 16 * 3) / 2.5,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 0.3,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Hero(
                              tag: _playlist.thumbnail!,
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(seconds: 0),
                                imageUrl: _playlist.thumbnail!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          _playlist.title ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox.expand(
                      child: MaterialButton(
                        onPressed: () {
                          AppNavigator.push(
                            TabbarController.context!,
                            GradientBackgroundView(
                              colors: [
                                //Color.fromARGB(255, 167, 207, 210),
                                _playlist.color,
                                Application.colors.backgroundColor!
                                    .withAlpha(50),
                                Application.colors.backgroundColor!,
                              ],
                              contentView: PlayListScreen(
                                playlist: _playlist,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
