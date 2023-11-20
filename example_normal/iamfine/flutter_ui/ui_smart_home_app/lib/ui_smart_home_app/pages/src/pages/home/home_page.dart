import 'package:flutter/material.dart';

import 'compontents/ActiveRooms.dart';
import 'compontents/Header.dart';
import 'compontents/Rooms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
              ),
              child: const Column(
                children: [
                  Rooms(),
                  ActiveRooms(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
