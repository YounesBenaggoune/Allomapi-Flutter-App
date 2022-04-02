import 'package:allomapi/screens/MapScreen/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import './screens/TabsScreen/tabs_screen.dart';
import './screens/ObjectsScreen/objects_screen.dart';
import './screens/HomeScreen/home_screen.dart';
import './screens/HistoryScreen/history_screen.dart';
import './screens/ControlScreen/control_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './services/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.subscribeToTopic('flutter');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  // This uwidget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Allomapi',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (ctx) => const TabsScreen(),
            '/objects-screen': (ctx) => const ObjectsScreen(),
            '/map-screen': (ctx) => const MapScreen(),
            '/home-screen': (ctx) => const HomeScreen(),
            '/history-screen': (ctx) => const HistoryScreen(),
            '/control-screen': (ctx) => const ControlScreen(),
          },
        );
      },
    );
  }
}



// import 'package:http/http.dart' as http;
// import 'package:workmanager/workmanager.dart';

// fetchEvents() {
//   final data = await http.post(
//     Uri.parse('http://server.allomapi.com/app/eventsNv.php'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(
//       {'user': 5},
//     ),
//   );
//   print('Data Fetched');
// }

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     fetchEvents();
//     print("Native called background task:"); //simpleTask will be emitted here.
//     return Future.value(true);
//   });
// }


// WidgetsFlutterBinding.ensureInitialized();

  // Workmanager().initialize(
  //     callbackDispatcher, // The top level function, aka callbackDispatcher
  //     isInDebugMode:
  //         true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  //     );
  // Workmanager().registerOneOffTask("2", "simpleTaskk");