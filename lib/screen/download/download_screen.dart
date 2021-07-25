import 'dart:io';

import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  void initState() {
    a();
    super.initState();
  }

  Future<void> a() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    final files = Directory("$appDocPath/ChillMusic/").listSync();
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
          "Download",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
    );
  }
}
