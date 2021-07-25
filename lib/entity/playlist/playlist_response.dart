import 'package:chill_music/entity/publisher/publisher_response.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'playlist_detail_reponse.dart';

class PlaylistResponse {
  final String? id;
  final String? title;
  final String? thumbnail;
  final List<int>? colorRaw;
  final PublisherResponse? publisher;

  late PlaylistDetailResponse detail;
  late Color color =
      Color.fromARGB(255, colorRaw![0], colorRaw![1], colorRaw![2]);

  PlaylistResponse({
    this.publisher,
    this.colorRaw,
    this.id,
    this.title,
    this.thumbnail,
  });
}
