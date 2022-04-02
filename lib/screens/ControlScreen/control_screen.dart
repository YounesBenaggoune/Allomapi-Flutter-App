import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/custom_dialog_box.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xffF3F5F7), // backgroundColor: const Color(0xffEDF0F8),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 18),
              width: double.infinity,
              // height: 30.h,
              decoration: const BoxDecoration(
                color: Color(0xff1c6dd0),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '01523-119-05',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '250',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            'km/h',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.gps_fixed,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),
                          Text(
                            'CONNECTED',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.wifi,
                              color: Colors.red,
                              size: 28,
                            ),
                          ),
                          Text(
                            'DISCONNECTED',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              height: 100.w,
              child: Image.asset('assets/images/car.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.white, // Button color
                    child: InkWell(
                      splashColor: Colors.white10, // Splash color
                      onTap: () {},
                      child: SizedBox(
                        width: 8.5.h,
                        height: 8.5.h,
                        child: const Icon(
                          Icons.speed,
                          color: Color(0xff1c6dd0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(-60),
                          degOneTranslationAnimation.value * 80),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              spreadRadius: 8,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 9), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // Button color
                            child: InkWell(
                              splashColor: Colors.white10, // Splash color
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const CustomDialogBox(
                                      title: "Custom Dialog Demo",
                                      descriptions:
                                          "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                                      text: "Yes",
                                    );
                                  },
                                );
                              },
                              child: const SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.sms_outlined,
                                  size: 28,
                                  color: Color(0xff1c6dd0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(-120),
                          degOneTranslationAnimation.value * 80),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.04),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // Button color
                            child: InkWell(
                              splashColor: Colors.white10, // Splash color
                              onTap: () {},
                              child: const SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.gps_fixed_outlined,
                                  size: 32,
                                  color: Color(0xff1c6dd0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.04),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Material(
                          color: Colors.white, // Button color
                          child: InkWell(
                            splashColor: Colors.white10, // Splash color
                            onTap: () {
                              if (animationController.isCompleted) {
                                animationController.reverse();
                              } else {
                                animationController.forward();
                              }
                            },
                            child: SizedBox(
                              width: 10.h,
                              height: 10.h,
                              child: Icon(
                                Icons.power_settings_new,
                                size: 5.h,
                                color: const Color(
                                    0xffFF1700), // Color(0xff1c6dd0)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                ClipOval(
                  child: Material(
                    color: Colors.white, // Button color
                    child: InkWell(
                      splashColor: Colors.white10, // Splash color
                      onTap: () {},
                      child: SizedBox(
                        width: 8.5.h,
                        height: 8.5.h,
                        child: const Icon(
                          Icons.lock,
                          color: Color(0xff1c6dd0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
