import 'package:flutter/material.dart';

import '../ControlScreen/control_screen.dart';
import '../MapScreen/map_screen.dart';
import '../ObjectsScreen/objects_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../HistoryScreen/history_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final double _iconSize = 28;

  static const List<Widget> _screens = <Widget>[
    ObjectsScreen(),
    MapScreen(),
    HomeScreen(),
    HistoryScreen(),
    ControlScreen(),
  ];

  int _selectedScreenIndex = 2;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedScreenIndex),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xff1067EB),
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.home,
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car,
              size: _iconSize,
            ),
            label: 'Objects',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: _iconSize,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                color: Color(0xff1c6dd0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                  size: _iconSize,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: _iconSize,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.control_camera,
              size: _iconSize,
            ),
            label: 'Control',
          ),
        ],
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            const Color(0xffF3F5F7), // backgroundColor:const Color(0xffEDF0F8)
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        selectedFontSize: 0,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}
