import 'package:chill_music/core/tools/app_size.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class Application {
  static BuildContext? _context;
  static AppSize? _size;
  static AppColors? _colors = AppColors();
  static BuildContext get rootContext {
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

  static BuildContext? _playlistContext;
  static BuildContext? _libraryContext;

  static BuildContext? get playlistContext {
    return _playlistContext;
  }

  static BuildContext? get libraryContext {
    return _libraryContext;
  }

  static void setSubContext(
      {BuildContext? context, required ScreenEnum screen}) {
    switch (screen) {
      case ScreenEnum.home:
        break;
      case ScreenEnum.search:
        break;
      case ScreenEnum.playlist:
        _playlistContext = context;
        break;
      case ScreenEnum.library:
        _libraryContext = context;
        break;
      default:
    }
  }
}

enum ScreenEnum {
  home,
  search,
  playlist,
  library,
}
