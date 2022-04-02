import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../ControlScreen/control_screen.dart';
import '../../widgets/global_chart.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/notification_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void navigat(BuildContext ctx) {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (_) => const ControlScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 33.h,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color(0xff1c6dd0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const TextInput(),
                        const SizedBox(height: 14),
                        SizedBox(
                          height: 28.h,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: GlobalChart(),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: const [
                                      ObjecLabel('Moving', 100, Colors.green),
                                      ObjecLabel('Paused', 80, Colors.orange),
                                      ObjecLabel('Stopped', 120, Colors.red),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12, left: 12),
                child: Text(
                  'Objects',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 28.h,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: 90.w,
                      child: const ObjectCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: 90.w,
                      child: const ObjectCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: 90.w,
                      child: const ObjectCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: 90.w,
                      child: const ObjectCard(),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12, left: 12, top: 12),
                child: Text(
                  'Recent Events',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: const <Widget>[
                    NotificationCard(
                        'OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
                    NotificationCard(
                        'OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
                    NotificationCard(
                        'OVERSPEED', '23568', '12/6/2021, 12:14:09 PM'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ObjecLabel extends StatelessWidget {
  final color;
  final String label;
  final int value;
  const ObjecLabel(this.label, this.value, this.color, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: 8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                color: color,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.data_saver_off_outlined,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      value.toString(),
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    label,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ObjectCard extends StatelessWidget {
  const ObjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.02),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final double width;
  const HomeCard(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 220,
      child: GlobalChart(),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        hintText: 'Enter a search term',
        hintStyle: const TextStyle(
          color: Colors.black38,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
