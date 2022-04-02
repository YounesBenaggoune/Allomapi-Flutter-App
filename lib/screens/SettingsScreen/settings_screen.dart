import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';
import '../AccountSettings/account_settings.dart';
import '../NotificationsSettings/notifications_settings.dart';
import '../AboutScreen/about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xffEDF0F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.blue,
              ),
              SettingRow(
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountSettings(),
                    ),
                  )
                },
                'Account',
                Icon(
                  Icons.person_outlined,
                  color: Colors.blue.shade400,
                ),
              ),
              SettingRow(
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotifictionsSettings(),
                    ),
                  )
                },
                'Notifications',
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.orange.shade400,
                ),
              ),
              SettingRow(
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountSettings(),
                    ),
                  )
                },
                'Language',
                Icon(Icons.g_translate_outlined, color: Colors.green.shade400),
              ),
              SettingRow(
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  )
                },
                'About',
                Icon(
                  Icons.info_outline_rounded,
                  color: Colors.purple.shade400,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SettingRow(
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountSettings(),
                    ),
                  )
                },
                'Logout',
                Icon(
                  Icons.logout_outlined,
                  color: Colors.red.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  final String name;
  final Widget icon;
  final onTabHandler;
  const SettingRow(this.onTabHandler, this.name, this.icon, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTabHandler,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.07),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Icon(
                Icons.chevron_right_sharp,
                color: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
