import 'package:flutter/material.dart';
import 'homepage.dart';

class WheelscrollUI extends StatelessWidget {
  const WheelscrollUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
