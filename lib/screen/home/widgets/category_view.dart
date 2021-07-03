import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

import 'title_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView(
          title: "Nature sound",
        ),
        SizedBox(
          height: 14,
        ),
        SizedBox(
          height: (Application.size.width! - 16 * 3) / 2.5 + 36,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (contetx, index) {
              return Container(
                margin: EdgeInsets.only(right: 16),
                width: (Application.size.width! - 16 * 3) / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (Application.size.width! - 16 * 3) / 2.5,
                      height: (Application.size.width! - 16 * 3) / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(seconds: 0),
                          imageUrl:
                              "https://i.scdn.co/image/ab67706c0000bebbaaa87e17e5a9a7fe261fc08e",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Rain & Chill",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
