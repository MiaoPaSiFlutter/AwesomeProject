import 'package:flutter/material.dart';
import 'home_page.dart';


class MathGameUI extends StatelessWidget {
  const MathGameUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
