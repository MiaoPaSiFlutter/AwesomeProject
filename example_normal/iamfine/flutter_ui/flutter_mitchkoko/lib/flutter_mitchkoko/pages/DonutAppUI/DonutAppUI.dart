import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class DonutAppUI extends StatelessWidget {
  const DonutAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}
