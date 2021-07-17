import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ProviderPlayer {
  static Map<String, dynamic> _instance = Map<String, dynamic>();

  static void cache(String url, AudioPlayer object) {
    _instance[url] = object;
  }

  static Future<AudioPlayer?> get({@required String? url}) async {
    if (_instance[url] == null) {
      var _player = await _initPlayer(url!);
      if (_player != null) {
        ProviderPlayer.cache(url, _player);
      } else {
        return null;
      }
    }
    return _instance[url];
  }

  static void remove(String url) {
    var _player = ProviderPlayer.get(url: url);
    if (_player is AudioPlayer) {
      _instance.remove(url);
    } else {
      print("can't delete object");
    }
  }

  static void clearAll() {
    _instance = Map<String, dynamic>();
  }

  static Future<AudioPlayer?> _initPlayer(String url) async {
    AudioPlayer _player = AudioPlayer();
    // _player.playbackEventStream.listen((event) {},
    //     onError: (Object e, StackTrace stackTrace) {
    //   print('A stream error occurred: $e');
    // });

    try {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(url),
        ),
      );
    } catch (e) {
      print("Error loading audio source: $e");
      return null;
    }
    return _player;
  }
}
