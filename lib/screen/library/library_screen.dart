import 'dart:io';
import 'package:chill_music/core/download_worker/download_worker.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

//library
class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  void initState() {
    a();
    super.initState();
  }

  Future<void> a() async {
    final files = Directory(DownloadWorker.localPath).listSync();
    for (int i = 0; i < files.length; i++) {
      print(files[i].path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Application.colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Application.colors.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Library",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
    );
  }
}
