import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'widgets/maintab.dart';

class UIFacebookApp extends GetView<UIFacebookAppController> {
  const UIFacebookApp({super.key});

  @override
  UIFacebookAppController get controller => Get.put(UIFacebookAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIFacebookAppController extends GetxController {
  UIFacebookAppController();

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
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MainTab(),
    );
  }
}
