import 'package:flutter/material.dart';
import 'package:simple_notifiy_app/main.dart';
import 'package:simple_notifiy_app/ui/detail_page.dart';
import 'package:simple_notifiy_app/utils/notification_helper.dart';
import 'package:simple_notifiy_app/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
        context, DetailPage.routeName);
    _notificationHelper.configureDidReceiveLocalNotificationSubject(
        context, DetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Notification'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  CustomButton(
                      text: 'Show plain notification with payload',
                      onPressed: () async {
                        await _notificationHelper
                            .showNotification(flutterLocalNotificationsPlugin);
                      }),
                  const SizedBox(height: 10),
                  CustomButton(
                      text:
                          'Show plain notification that has no body with payload',
                      onPressed: () async {
                        await _notificationHelper.showNotificationsWithNoBody(
                            flutterLocalNotificationsPlugin);
                      }),
                  const SizedBox(height: 10),
                  CustomButton(
                      text: 'Show grouped notification [Android]',
                      onPressed: () async {
                        await _notificationHelper.showGroupNotifications(
                            flutterLocalNotificationsPlugin);
                      }),
                  const SizedBox(height: 10),
                  CustomButton(
                      text:
                          'Show progress notification - updates every second [Android]',
                      onPressed: () async {
                        await _notificationHelper.showProgressNotification(
                            flutterLocalNotificationsPlugin);
                      }),
                  const SizedBox(height: 10),
                  CustomButton(
                      text: 'Show big picture notification [Android]',
                      onPressed: () async {
                        await _notificationHelper.showBigPictureNotification(
                            flutterLocalNotificationsPlugin);
                      }),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Show notification with attachment [iOS]',
                    onPressed: () async {
                      await _notificationHelper.showNotificationWithAttachment(
                          flutterLocalNotificationsPlugin);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
