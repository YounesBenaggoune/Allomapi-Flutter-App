import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/object_card_list.dart';
import '../HomeScreen/home_screen.dart';

// class ObjectsScreen extends StatelessWidget {
//   const ObjectsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Hello'),
//     );
//   }
// }

class ObjectsScreen extends StatelessWidget {
  const ObjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEDF0F8),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          // color: Colors.cyan,
          child: Column(
            children: [
              SizedBox(
                height: 17.h,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding:
                      EdgeInsets.only(top: 1.h, right: 0, left: 0, bottom: 8),
                  alignment: Alignment.topCenter,
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    // color: Color(0xff1067EB),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff1c6dd0),
                        Color(0xff1c6dd0),
                        // Colors.deepPurpleAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: TextInput(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 5.5.h,
                        child: ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 120,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(41, 41, 41, 0.3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                              child: const Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 120,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(41, 41, 41, 0.3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                              child: const Text(
                                'Moving',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 120,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(41, 41, 41, 0.3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                              child: const Text(
                                'Stopped',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 120,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(41, 41, 41, 0.3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                              child: const Text(
                                'Paused',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: ObjectsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ObjectsList extends StatelessWidget {
  const ObjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        ListObjectCard(
            "Constantine 59 ZI le Palma, 25000", "05689-112-45", "60"),
        ListObjectCard(
            "Constantine 59 ZI le Palma, 25000", "78952-110-45", "120"),
        ListObjectCard(
            "Constantine 59 ZI le Palma, 25000", "95631-114-45", "180"),
        ListObjectCard(
            "Constantine 59 ZI le Palma, 25000", "78569-117-45", "200"),
        ListObjectCard(
            "Constantine 59 ZI le Palma, 25000", "45689-115-45", "160"),
        ListObjectCard(
            "Constantine 59 ZI le Palma, 25000", "09568-118-45", "80"),
        ListObjectCard(
            "Constantine 59 ZI le Palma, 25000", "42563-116-45", "100"),
      ],
    );
  }
}
