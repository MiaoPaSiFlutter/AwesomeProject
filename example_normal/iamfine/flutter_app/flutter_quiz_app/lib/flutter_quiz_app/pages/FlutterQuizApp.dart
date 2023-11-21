import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'screens/welcome/welcome_screen.dart';


class FlutterQuizApp extends GetView<FlutterQuizAppController> {
  const FlutterQuizApp({super.key});

  @override
  FlutterQuizAppController get controller =>
      Get.put(FlutterQuizAppController());

  @override
  Widget build(BuildContext context) {
    return MyAppWrapper();
  }
}

class FlutterQuizAppController extends GetxController {
  FlutterQuizAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyAppWrapper extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
