import 'dart:io';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class DownloadWorker {
  DownloadWorker() {
    _prepareSaveDir();
  }
  static late String _localPath;

  static String get localPath {
    return _localPath;
  }

  Future<String?> _findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory?.path;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())! + '/ChillMusic/';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  late bool _isDownloading = false;

  void requestDownload({
    required String title,
    required String url,
    required Function onProgress,
    required Function onDone,
  }) async {
    if (_isDownloading) {
      return;
    }
    Fluttertoast.showToast(
      msg: "Downloading '$title'...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );

    _isDownloading = true;
    final downloaderUtils = DownloaderUtils(
      progressCallback: (current, total) {
        final progress = (current / total) * 100;
        onProgress(progress.floor());
      },
      file: File('$_localPath/$title.mp3'),
      progress: ProgressImplementation(),
      onDone: () {
        _isDownloading = false;
        onDone('$_localPath/$title.mp3');
        print('Download done');
      },
      deleteOnCancel: true,
    );

    await Flowder.download(
      url,
      downloaderUtils,
    );
  }
}
