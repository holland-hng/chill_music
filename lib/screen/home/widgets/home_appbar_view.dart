import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBarView extends StatefulWidget {
  const HomeAppBarView({Key? key}) : super(key: key);

  @override
  _HomeAppBarViewState createState() => _HomeAppBarViewState();
}

class _HomeAppBarViewState extends State<HomeAppBarView> {
  late double _width = Application.size.width - 28 * 2;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Application.colors.backgroundColor,
      expandedHeight: 70,
      flexibleSpace: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Application.colors.backgroundColor,
              height: Application.size.statusBar + 15,
            ),
            BouncingAmazingButton(
              key: ObjectKey("HomeAppBarView"),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 45,
                width: _width,
                decoration: BoxDecoration(
                  color: Application.colors.darkGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   CupertinoIcons.search,
                    //   size: 20,
                    //   color: Application.colors.lightGrey,
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // Text(
                    //   "Your current mood",
                    //   style: TextStyle(
                    //       fontSize: 15, color: Application.colors.lightGrey),
                    // ),
                    Text(
                      "Chill Music - Your day",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Application.colors.backgroundColor,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
