import 'package:flutter/material.dart';

import 'FirstLayer.dart';
import 'HomePage.dart';
import 'SecondLayer.dart';
import 'ThirdLayer.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(),
          SecondLayer(key: secondLayerKey),
          ThirdLayer(),
          HomewPage(),
        ],
      ),
    );
  }
}
