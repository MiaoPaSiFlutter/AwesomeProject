import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:layout/layout.dart';

import '../theme/app_theme.dart';
import '../values/values.dart';
import 'home/home_page.dart';

class FlutterNimbusApp extends GetView<FlutterNimbusAppController> {
  const FlutterNimbusApp({super.key});

  @override
  FlutterNimbusAppController get controller =>
      Get.put(FlutterNimbusAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class FlutterNimbusAppController extends GetxController {
  FlutterNimbusAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_NAME,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
