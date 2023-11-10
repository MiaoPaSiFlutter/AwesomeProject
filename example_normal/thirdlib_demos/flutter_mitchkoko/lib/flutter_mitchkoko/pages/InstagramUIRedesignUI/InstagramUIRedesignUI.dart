import 'package:flutter/material.dart';

import 'screens/screens_handler.dart';
import 'themes/themes.dart';

class InstagramUIRedesignUI extends StatelessWidget {
  const InstagramUIRedesignUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Instagram UI redesign',
      home: Homepage(),
    );
  }
}
