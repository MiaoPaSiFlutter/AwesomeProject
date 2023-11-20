import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../routers/routers_index.dart';
import '../tools/tools_index.dart';
import 'dashboard/dashboard_screen.dart';

class FitnessApp extends GetView<FitnessAppController> {
  const FitnessApp({super.key});

  @override
  FitnessAppController get controller => Get.put(FitnessAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class FitnessAppController extends GetxController {
  FitnessAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
          primaryColor: AppColors.primaryColor1,
          useMaterial3: true,
          fontFamily: "Poppins"),
      home: const DashboardScreen(),
    );
  }
}
