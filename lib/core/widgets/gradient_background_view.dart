import 'dart:ui';

import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class GradientBackgroundView extends StatelessWidget {
  final Widget? contentView;
  final List<Color>? colors;
  const GradientBackgroundView({
    Key? key,
    this.contentView,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Application.colors.backgroundColor,
      body: Container(
        width: Application.size.width,
        height: Application.size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors!,
          ),
        ),
        child: Stack(
          children: [
            SizedBox.expand(
              child: Container(
                color: Application.colors.backgroundColor?.withOpacity(0.4),
              ),
            ),
            contentView!,
          ],
        ),
      ),
    );
  }
}
