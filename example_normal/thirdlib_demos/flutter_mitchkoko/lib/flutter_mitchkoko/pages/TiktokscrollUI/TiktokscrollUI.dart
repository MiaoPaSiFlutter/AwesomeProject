import 'package:flutter/material.dart';
import 'homepage.dart';

class TiktokscrollUI extends StatelessWidget {
  const TiktokscrollUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
