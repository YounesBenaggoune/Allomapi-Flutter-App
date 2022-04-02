import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xffEDF0F8),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
          NotificationCard('OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
        ],
      ),
    );
  }
}
