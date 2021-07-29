import 'package:chill_music/core/deeplink/deeplink_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalNotidicationManager {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  LocalNotidicationManager() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('launcher_icon');
    var initializationSettingsIOS = IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void showNotification({
    required String title,
    required String body,
    bool playSound = true,
    DeeplinkType deeplinkType = DeeplinkType.none,
  }) async {
    var android = AndroidNotificationDetails(
      'id',
      'channel',
      'description',
      priority: Priority.high,
      importance: Importance.max,
      playSound: playSound,
    );
    var iOS = IOSNotificationDetails(presentSound: playSound);
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platform,
      payload: deeplinkType.string,
    );
  }

  Future onSelectNotification(String? payload) async {
    DeeplinkManager.excute(payload ?? "");
    return "";
  }
}
