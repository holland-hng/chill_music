import 'package:chill_music/core/tools/app_size.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class Application {
  static BuildContext? _context;
  static AppSize? _size;
  static AppColors? _colors = AppColors();
  static BuildContext get context {
    return _context!;
  }

  static AppSize get size {
    return _size!;
  }

  static AppColors get colors {
    return _colors!;
  }

  Application._privateConstructor();

  static final Application _instance = Application._privateConstructor();

  factory Application() {
    return _instance;
  }
  static void setContext(BuildContext context) {
    Application._context = context;
    Application._size = AppSize(context);
  }
}
