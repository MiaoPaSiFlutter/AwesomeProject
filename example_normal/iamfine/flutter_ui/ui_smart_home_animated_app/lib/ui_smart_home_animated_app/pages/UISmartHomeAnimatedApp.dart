import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'core/app/app.dart';

class UISmartHomeAnimatedApp extends GetView<UISmartHomeAnimatedAppController> {
  const UISmartHomeAnimatedApp({super.key});

  @override
  UISmartHomeAnimatedAppController get controller =>
      Get.put(UISmartHomeAnimatedAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UISmartHomeAnimatedAppController extends GetxController {
  UISmartHomeAnimatedAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SmartHomeApp();
  }
}
