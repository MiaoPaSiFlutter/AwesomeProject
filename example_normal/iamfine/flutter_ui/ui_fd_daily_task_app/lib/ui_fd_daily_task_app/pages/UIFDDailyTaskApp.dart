import 'dart:ui';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import 'app/config/themes/app_theme.dart';
import 'app/features/dashboard/views/screens/dashboard_screen.dart';

class UIFDDailyTaskApp extends GetView<UIFDDailyTaskAppController> {
  const UIFDDailyTaskApp({super.key});

  @override
  UIFDDailyTaskAppController get controller =>
      Get.put(UIFDDailyTaskAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIFDDailyTaskAppController extends GetxController {
  UIFDDailyTaskAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
