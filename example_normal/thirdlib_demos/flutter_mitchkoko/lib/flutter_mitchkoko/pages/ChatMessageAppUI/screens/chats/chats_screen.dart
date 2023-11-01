import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../helper/helper_index.dart';
import 'components/appBar_build.dart';
import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: const Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.person_add_alt_1, color: Colors.white),
        ),
        bottomNavigationBar: buildBottomNavigationBar());
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      // type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
            icon: Icon(Icons.message), label: 'Chats'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.people), label: 'People'),
        const BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(Utils.assets("images/user_2.png")),
            ),
            label: 'Profile'),
      ],
    );
  }
}
