import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/NotificationsScreen/notifications_screen.dart';
import '../screens/SettingsScreen/settings_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: SvgPicture.asset(
        'assets/icons/allomapi.svg',
        fit: BoxFit.fill,
        width: 140,
      ),
      elevation: 0,
      // backgroundColor: Colors.grey, // const Color(0xff1c6dd0)
      backgroundColor: const Color(0xff1c6dd0),
      // backgroundColor: Colors.transparent,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.notifications,
              size: 28,
            ),
          ),
        ),
      ],
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.menu,
          size: 28,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
