import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_notifiy_app/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotification(flutterLocalNotificationsPlugin);
  notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);
  runApp(
    MaterialApp(),
  );
}
