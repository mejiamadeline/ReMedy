import'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notifications
{
  static final notif =
  FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app_icon');

  static Future notifDetails() async
  {
    return NotificationDetails(
      android: AndroidNotificationDetails(
       'channel id',
       'channel name',
        'channel description',
       importance: Importance.max,
      ),
    );
  }

  static void scheduledNotification({
  int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async =>
      notif.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate,tz.local),
        await notifDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      );
}