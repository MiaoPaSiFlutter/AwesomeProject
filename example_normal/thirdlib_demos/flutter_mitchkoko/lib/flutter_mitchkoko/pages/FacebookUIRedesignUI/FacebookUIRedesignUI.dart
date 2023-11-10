import 'package:flutter/material.dart';
import 'widgets/maintab.dart';

class FacebookUIRedesignUI extends StatelessWidget {
  const FacebookUIRedesignUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MainTab(),
    );
  }
}
