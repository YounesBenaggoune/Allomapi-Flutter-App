import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//----------------------------------

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

const InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
);

//-----------------------------------

// message.data['title'],
// message.data['body'],

Future<void> onBackgroundMessage(RemoteMessage message) async {
  // await FirebaseMessaging.instance.subscribeToTopic('flutter');
  RemoteNotification? notification = message.notification;

  const String name = "yunus";

  if (name == 'yunus') {
    print('OKay --------------------->');
  }

  flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    'Background Notification', // notification?.title
    notification?.body,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'default_notification_channel_id',
        'default_notification_channel_id',
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound(
          'alarm_sound',
        ),
        playSound: true,
        enableVibration: true,
      ),
    ),
  );
}

class FCM {
  final _firebaseMessaging = FirebaseMessaging.instance;

  setNotifications() async {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    FirebaseMessaging.onMessage.listen(
      (message) async {
        RemoteNotification? notification = message.notification;

        // Handle notification message
        print('CODE------------------------------>>>>>>>>>>>>');

        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'default_notification_channel_id-2',
              'default_notification_channel_id-2',
              importance: Importance.max,
              sound: RawResourceAndroidNotificationSound(
                'alarm_sound',
              ),
              playSound: true,
              enableVibration: true,
            ),
          ),
        );
      },
    );
    // final settings = FirebaseMessaging.instance.getNotificationSettings();
    // print(settings);
    // // With this token you can test it easily on your phone
    // final token =
    //     _firebaseMessaging.getToken().then((value) => print('Token: $value'));
  }
}
