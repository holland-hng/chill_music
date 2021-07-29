import 'package:chill_music/core/tools/app_navigator.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/library/bloc/library_bloc.dart';
import 'package:chill_music/screen/tabbar_controller/bloc/tabbar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum DeeplinkType {
  downloadComplete,
  none,
}

extension DeeplinkTypeExtension on DeeplinkType {
  String get string {
    switch (this) {
      case DeeplinkType.downloadComplete:
        return "chillmusic.com/download_complete";
      default:
    }
    return "";
  }

  static DeeplinkType getType(String deeplinkString) {
    switch (deeplinkString) {
      case "chillmusic.com/download_complete":
        return DeeplinkType.downloadComplete;
      default:
    }
    return DeeplinkType.none;
  }
}

class DeeplinkManager {
  static void excute(String payload) {
    DeeplinkType type = DeeplinkTypeExtension.getType(payload);
    switch (type) {
      case DeeplinkType.downloadComplete:
        _handleOpenCompleteDownload();
        break;
      default:
    }
  }

  static void _handleOpenCompleteDownload() {
    Application.libraryContext?.read<LibraryBloc>().add(FetchLibraryEvent());
    if (Application.playlistContext != null) {
      AppNavigator.pop(Application.rootContext);
    } else {
      //do nothing
    }
    Application.rootContext.read<TabbarBloc>().add(TapToChangePageEvent(2));
  }
}
