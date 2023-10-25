import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "Today",
            svgScr: NormalModuleUtils.configPackagesImage(
                packagename: "flutter_mitchkoko",
                name: "assets/MeditationAppUI/icons/calendar.svg"),
          ),
          BottomNavItem(
            title: "All Exercises",
            svgScr: NormalModuleUtils.configPackagesImage(
                packagename: "flutter_mitchkoko",
                name: "assets/MeditationAppUI/icons/gym.svg"),
            isActive: true,
          ),
          BottomNavItem(
            title: "Settings",
            svgScr: NormalModuleUtils.configPackagesImage(
                packagename: "flutter_mitchkoko",
                name: "assets/MeditationAppUI/icons/Settings.svg"),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function()? press;
  final bool isActive;
  const BottomNavItem({
    Key? key,
    required this.svgScr,
    required this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
