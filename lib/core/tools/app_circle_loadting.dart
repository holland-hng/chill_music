import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCircleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator()
          : CupertinoActivityIndicator(
              radius: 13,
            ),
    );
  }
}
