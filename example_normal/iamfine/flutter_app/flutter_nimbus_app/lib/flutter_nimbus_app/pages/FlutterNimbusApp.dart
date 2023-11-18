import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../theme/app_theme.dart';
import '../values/values.dart';
import 'home/home_page.dart';

class FlutterNimbusApp extends StatelessWidget {
  const FlutterNimbusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_NAME,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
