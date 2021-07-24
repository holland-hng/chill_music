import 'package:chill_music/core/widgets/bouncing_button.dart';

import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final Function onTap;
  const MoreButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 22),
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 17,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 3.5,
            ),
            Container(
              width: 13,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 3.5,
            ),
            Container(
              width: 9,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
