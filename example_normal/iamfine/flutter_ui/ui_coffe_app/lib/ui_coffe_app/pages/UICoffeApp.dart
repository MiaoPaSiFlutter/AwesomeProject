import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'config/services_locator.dart';
import 'home.page.dart';

class UICoffeApp extends GetView<UICoffeAppController> {
  const UICoffeApp({super.key});

  @override
  UICoffeAppController get controller => Get.put(UICoffeAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UICoffeAppController extends GetxController {
  UICoffeAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    initServicesLocator();
    super.initState();
  }

  @override
  void dispose() {
    disposeServicesLocator();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
