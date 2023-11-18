import 'dart:ui';

import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'app/features/dashboard/views/screens/dashboard_screen.dart';

class FDDailyTaskAppUI extends StatelessWidget {
  const FDDailyTaskAppUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Task',
      theme: AppTheme.basic,
      scrollBehavior: CustomScrollBehaviour(),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class CustomScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
