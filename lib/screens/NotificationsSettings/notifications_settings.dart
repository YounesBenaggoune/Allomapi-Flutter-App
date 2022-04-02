import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class NotifictionsSettings extends StatelessWidget {
  const NotifictionsSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('NotifictionsSettings'),
      ),
    );
  }
}
