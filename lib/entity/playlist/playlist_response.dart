import 'package:chill_music/entity/audio/audio_response.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
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

  PlaylistResponse({
    this.colorRaw,
    this.audios,
    this.id,
    this.title,
    this.listens,
    this.likes,
    this.thumbnail,
  });
}
