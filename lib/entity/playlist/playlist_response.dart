import 'package:chill_music/entity/publisher/publisher_response.dart';
import 'package:flutter/material.dart';

class PlaylistResponse {
  final String? id;
  late Color color =
      Color.fromARGB(255, colorRaw![0], colorRaw![1], colorRaw![2]);
  final String? title;

  final String? thumbnail;
  final List<int>? colorRaw;

  final PublisherResponse? publisher;

  PlaylistResponse({
    this.publisher,
    this.colorRaw,
    this.id,
    this.title,
    this.thumbnail,
  });
}
