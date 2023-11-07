import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/core_index.dart';

class TaskManagementAppUI extends StatelessWidget {
  const TaskManagementAppUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Task Management',
        debugShowCheckedModeBanner: false,
        theme: AppColors.getTheme,
        initialRoute: Routes.onBoarding,
        onGenerateRoute: RouterGenerator.generateRoutes,
      );
    });
  }
}
