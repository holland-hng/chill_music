import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              heroTag: "SearchScreen",
              backgroundColor: Application.colors.backgroundColor,
              largeTitle: Text(
                "Search",
                style: TextStyle(color: Colors.white),
              ),
            )
          ];
        },
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (contetx, index) {
            return Text("data");
          },
        ),
      ),
    );
  }
}
