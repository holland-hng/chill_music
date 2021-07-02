import 'dart:ui';

import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class BlurGradientBackgroundView extends StatelessWidget {
  final Widget? contentView;
  const BlurGradientBackgroundView({
    Key? key,
    this.contentView,
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
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Application.colors.backgroundColor!,
              Colors.blue,
            ],
          ),
        ),
        child: Stack(
          children: [
            SizedBox.expand(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Application.colors.backgroundColor?.withOpacity(0.4),
                ),
              ),
            ),
            contentView!,
          ],
        ),
      ),
    );
  }
}
