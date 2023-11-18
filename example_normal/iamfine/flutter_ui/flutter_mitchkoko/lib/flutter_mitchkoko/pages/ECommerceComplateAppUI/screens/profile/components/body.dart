import 'package:flutter/material.dart';

import '../../../helper/helper_index.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: Utils.assets("icons/User Icon.svg"),
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: Utils.assets("icons/Bell.svg"),
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: Utils.assets("icons/Settings.svg"),
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: Utils.assets("icons/Question mark.svg"),
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Utils.assets("icons/Log out.svg"),
            press: () {},
          ),
        ],
      ),
    );
  }
}
