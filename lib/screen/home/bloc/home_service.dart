import 'dart:convert';

import 'package:chill_music/core/tools/logger.dart';
import 'package:chill_music/entity/category/category_response.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  HomeService();
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('homeContents');

  Future<List<CategoryResponse>> fetchHomeContent() async {
    List<CategoryResponse> _categories = [];
    QuerySnapshot _querySnapshot = await _ref.get();
    _querySnapshot.docs.forEach((doc) {
      List<PlaylistResponse> _playlists = [];
      for (int i = 0; i < doc["playlists"].length; i++) {
        var data = doc["playlists"][i];
        PlaylistResponse _playlist = PlaylistResponse(
          id: data["playlistId"],
          title: data["title"],
          colorRaw: [
            data["color"][0],
            data["color"][1],
            data["color"][2],
          ],
          listens: data["listens"],
          likes: data["likes"],
          thumbnail: data["thumbnail"],
          audios: [],
        );
        _playlists.add(_playlist);
      }
      CategoryResponse _category = CategoryResponse(
        id: doc.reference.id,
        title: doc["title"],
        playlists: _playlists,
      );
      _categories.add(_category);
    });
    return _categories;
  }
}
