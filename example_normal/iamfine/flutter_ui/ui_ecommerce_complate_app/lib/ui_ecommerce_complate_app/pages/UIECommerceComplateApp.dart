import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'globals/globals_index.dart';
import 'routes.dart';
import 'screens/screen_index.dart';

class UIECommerceComplateApp extends GetView<UIECommerceComplateAppController> {
  const UIECommerceComplateApp({super.key});

  @override
  UIECommerceComplateAppController get controller =>
      Get.put(UIECommerceComplateAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIECommerceComplateAppController extends GetxController {
  UIECommerceComplateAppController();

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
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
