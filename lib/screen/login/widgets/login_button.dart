import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';

enum LoginType {
  google,
  facebook,
  twitter,
}

extension LoginTypeExtension on LoginType {
  String get path {
    switch (this) {
      case LoginType.google:
        return "assets/icons/icon_google.png";
      case LoginType.facebook:
        return "assets/icons/icon_facebook.png";
      case LoginType.twitter:
        return "assets/icons/icon_twitter.png";
      default:
        return "";
    }
  }

  String get name {
    switch (this) {
      case LoginType.google:
        return "Google";
      case LoginType.facebook:
        return "Facebook";
      case LoginType.twitter:
        return "Twitter";
      default:
        return "";
    }
  }

  double get width {
    switch (this) {
      case LoginType.google:
        return 20;
      case LoginType.facebook:
        return 20;
      case LoginType.twitter:
        return 24;
      default:
        return 0;
    }
  }
}

class LoginButton extends StatelessWidget {
  final LoginType type;
  final Function callBack;
  const LoginButton({Key? key, required this.type, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onTap: callBack,
      child: Container(
        margin: const EdgeInsets.only(
          left: 32,
          right: 32,
        ),
        height: 44,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black,
            width: 0.3,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(
                  "Continue with ${type.name}",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 3),
              width: 44,
              height: 44,
              child: Center(
                child: Container(
                  width: type.width,
                  height: type.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(type.path),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
