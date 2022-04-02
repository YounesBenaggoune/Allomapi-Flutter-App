import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('AboutScreen'),
      ),
    );
  }
}
