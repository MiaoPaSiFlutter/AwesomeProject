import 'package:flutter/material.dart';

import '../../helper/helper_index.dart';
import '../../utils/utils_index.dart';
import '../profile/profile_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            onTap: () => Navigator.pushNamed(context, ProfileScreen.route()),
            child: CircleAvatar(
              backgroundImage: AssetImage(Utils.assets('$kIconPath/me.png')),
              radius: 24,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Good Morning 👋',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Mansuriosdev',
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            iconSize: 28,
            icon: Image.asset(Utils.assets('$kIconPath/notification.png')),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            iconSize: 28,
            icon: Image.asset(Utils.assets('$kIconPath/light/heart@2x.png')),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
