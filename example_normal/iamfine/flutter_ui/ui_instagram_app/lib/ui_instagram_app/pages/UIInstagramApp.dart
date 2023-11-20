import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'screens/screens_handler.dart';
import 'themes/themes.dart';

class UIInstagramApp extends GetView<UIInstagramAppController> {
  const UIInstagramApp({super.key});

  @override
  UIInstagramAppController get controller =>
      Get.put(UIInstagramAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIInstagramAppController extends GetxController {
  UIInstagramAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
