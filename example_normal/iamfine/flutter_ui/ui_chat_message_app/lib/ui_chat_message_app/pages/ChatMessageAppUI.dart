import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'screens/welcome/welcome_screen.dart';
import 'theme.dart';

class UIChatMessageApp extends GetView<UIChatMessageAppController> {
  const UIChatMessageApp({super.key});

  @override
  UIChatMessageAppController get controller =>
      Get.put(UIChatMessageAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIChatMessageAppController extends GetxController {
  UIChatMessageAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const WelcomeScreen(),
    );
  }
}
