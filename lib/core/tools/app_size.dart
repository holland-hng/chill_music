import 'package:flutter/material.dart';

class AppSize {
  late double width;
  late double height;
  late double appBar;
  late double tabBar;
  late double statusBar;

  AppSize(
    BuildContext context,
  ) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    height = heightScreen;
    width = widthScreen;
    statusBar = MediaQuery.of(context).padding.top;
    appBar = statusBar + kToolbarHeight;
    tabBar = MediaQuery.of(context).padding.bottom;
  }
}
