import 'package:chill_music/entity/author/author_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

class AuthorLinkingView extends StatelessWidget {
  const AuthorLinkingView({
    Key? key,
    required this.playlist,
    required List<AuthorReponse> authors,
    required this.i,
  })  : _authors = authors,
        super(key: key);

  final PlaylistResponse? playlist;
  final List<AuthorReponse> _authors;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(right: 8),
      height: 30,
      decoration: BoxDecoration(
        color: playlist?.color.mix(Colors.black, 0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${_authors[i].name}",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
