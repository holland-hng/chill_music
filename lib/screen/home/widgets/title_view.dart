import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Application.size.appBar,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "It's your",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/icons/icon_search.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
