import 'package:flutter/material.dart';

import 'config/app_them.dart';
import 'pages/home.dart';

class SmartHomeAppUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: Home(),
    );
  }
}
