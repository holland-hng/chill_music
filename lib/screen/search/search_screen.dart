import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late double _heightAppBar;
  @override
  void initState() {
    _heightAppBar = 45 +
        34 +
        ((34 - Application.size.statusBar) < 0
            ? 0
            : (34 - Application.size.statusBar));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Application.colors.backgroundColor,
              expandedHeight: _heightAppBar,
              flexibleSpace: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Application.colors.backgroundColor,
                      height: Application.size.statusBar + 14,
                    ),
                    Container(
                      color: Application.colors.backgroundColor,
                      child: Container(
                        height: 45,
                        width: Application.size.width - 34 * 2,
                        decoration: BoxDecoration(
                          color: Application.colors.darkGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Your current mood",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 34,
                    ),
                  ],
                ),
              ),
            )
            // CupertinoSliverNavigationBar(
            //   heroTag: "SearchScreen",
            //   backgroundColor: Application.colors.backgroundColor,
            //   largeTitle: Text(
            //     "Search",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // )
          ];
        },
        body: ListView.builder(
          itemCount: 1000,
          itemBuilder: (contetx, index) {
            return Text("data");
          },
        ),
      ),
    );
  }
}
