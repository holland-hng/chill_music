import 'package:chill_music/entity/audio/audio_response.dart';
import 'package:chill_music/entity/publisher/publisher_response.dart';
import 'package:flutter/material.dart';

class PlaylistResponse {
  late String? id;
  late Color color =
      Color.fromARGB(255, colorRaw![0], colorRaw![1], colorRaw![2]);
  final String? title;
  final int? listens;
  final int? likes;
  final String? thumbnail;
  final List<int>? colorRaw;
  final List<AudioResponse>? audios;
  final PublisherResponse? publisher;

  PlaylistResponse({
    this.publisher,
    this.colorRaw,
    this.audios,
    this.id,
    this.title,
    this.listens,
    this.likes,
    this.thumbnail,
  });
}
