import 'package:flutter/material.dart';

class AppSize {
  double? width;
  double? height;
  double? appBar;
  double? tabBar;
  double? statusBar;

  AppSize(
    BuildContext context,
  ) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    height = heightScreen;
    width = widthScreen;
    statusBar = MediaQuery.of(context).padding.top;
    appBar = statusBar! + kToolbarHeight;
    tabBar = MediaQuery.of(context).padding.bottom;
  }
}
