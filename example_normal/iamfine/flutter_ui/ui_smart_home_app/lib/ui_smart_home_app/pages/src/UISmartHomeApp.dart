import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'config/app_them.dart';
import 'pages/home.dart';

class UISmartHomeApp extends GetView<UISmartHomeAppController> {
  const UISmartHomeApp({super.key});

  @override
  UISmartHomeAppController get controller =>
      Get.put(UISmartHomeAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UISmartHomeAppController extends GetxController {
  UISmartHomeAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: Home(),
    );
  }
}
