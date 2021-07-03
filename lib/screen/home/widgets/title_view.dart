import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final bool? isAppbar;
  final String? title;
  const TitleView({
    Key? key,
    this.isAppbar = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16, right: 16, top: Application.size.appBar! - 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (isAppbar!)
                Text(
                  "Donate",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
