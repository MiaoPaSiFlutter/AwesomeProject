import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'app/features/dashboard/views/screens/dashboard_screen.dart';
import 'app/config/themes/app_theme.dart';

class UIFDProjectManagementApp
    extends GetView<UIFDProjectManagementAppController> {
  const UIFDProjectManagementApp({super.key});

  @override
  UIFDProjectManagementAppController get controller =>
      Get.put(UIFDProjectManagementAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIFDProjectManagementAppController extends GetxController {
  UIFDProjectManagementAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic,
      home: const DashboardScreen(),
    );
  }
}
