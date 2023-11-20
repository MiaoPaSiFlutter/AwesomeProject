import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'home_page.dart';

class UIParallaxEffectApp extends GetView<UIParallaxEffectAppController> {
  const UIParallaxEffectApp({super.key});

  @override
  UIParallaxEffectAppController get controller =>
      Get.put(UIParallaxEffectAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class UIParallaxEffectAppController extends GetxController {
  UIParallaxEffectAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      title: 'Buy Tickets',
      home: const HomePage(),
    );
  }
}
