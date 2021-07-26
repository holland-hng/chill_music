import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'option_item_view.dart';

class DrawerOptionView extends StatelessWidget {
  const DrawerOptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.23),
            Colors.transparent,
          ],
        ),
      ),
      width: Application.size.width * 2 / 3,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: Application.size.appBar,
              ),
              OptionItemView(type: OptionItemType.download),
              OptionItemView(type: OptionItemType.history),
              OptionItemView(type: OptionItemType.favorite),
              OptionItemView(type: OptionItemType.rate),
            ],
          ),
        ),
      ),
    );
  }
}
