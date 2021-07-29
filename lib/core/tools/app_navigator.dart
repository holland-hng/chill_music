import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'application_context.dart';

class AppNavigator {
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void push(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static void presentReplacement(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
        fullscreenDialog: true,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static void present(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => screen,
      ),
    );
  }

  static void stopWait() {
    Navigator.of(Application.rootContext).pop();
  }

  static void wait() {
    showDialog<void>(
      context: Application.rootContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 22,
                  ),
                  CupertinoActivityIndicator(
                    radius: 16,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
