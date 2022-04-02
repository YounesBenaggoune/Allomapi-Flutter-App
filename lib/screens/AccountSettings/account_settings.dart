import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/text_input.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  void handleOldPassword(value) {
    print(value);
  }

  void handleSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextInput(
                  const Icon(
                    Icons.lock_outlined,
                    color: Color(0xff1c6dd0),
                  ),
                  'Enter Old Password',
                  handleOldPassword,
                ),
                const SizedBox(
                  height: 18,
                ),
                TextInput(
                  const Icon(
                    Icons.lock_outlined,
                    color: Color(0xff1c6dd0),
                  ),
                  'Enter New Password',
                  handleOldPassword,
                ),
                const SizedBox(
                  height: 18,
                ),
                TextInput(
                  const Icon(
                    Icons.lock_outlined,
                    color: Color(0xff1c6dd0),
                  ),
                  'Confirm Password',
                  handleOldPassword,
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: handleSubmit,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
