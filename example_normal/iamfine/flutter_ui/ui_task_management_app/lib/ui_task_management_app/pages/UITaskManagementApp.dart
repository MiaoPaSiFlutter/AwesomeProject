import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'core/core_index.dart';

class UITaskManagementApp extends GetView<UITaskManagementAppController> {
  const UITaskManagementApp({super.key});

  @override
  UITaskManagementAppController get controller =>
      Get.put(UITaskManagementAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UITaskManagementAppController extends GetxController {
  UITaskManagementAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
