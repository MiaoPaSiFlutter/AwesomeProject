import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'routing/routing.dart' as AnimatedTravelApp;

class UIAnimatedTravelApp extends GetView<UIAnimatedTravelAppController> {
  const UIAnimatedTravelApp({super.key});

  @override
  UIAnimatedTravelAppController get controller =>
      Get.put(UIAnimatedTravelAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIAnimatedTravelAppController extends GetxController {
  UIAnimatedTravelAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAY 3 APP UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const AnimatedTravelApp.Routing(),
    );
  }
}
