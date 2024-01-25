import 'package:flutter/material.dart';
import 'package:simple_notifiy_app/utils/received_notification.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail_page";
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReceivedNotification argumento =
        ModalRoute.of(context)?.settings.arguments as ReceivedNotification;
    return Scaffold(
      appBar: AppBar(
        title: Text('Title : ${argumento.payLoad}'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go Back!')),
      ),
    );
  }
}
