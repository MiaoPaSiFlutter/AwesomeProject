import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'theme.dart';


class ValorantInfoApp extends GetView<ValorantInfoAppController> {
  const ValorantInfoApp({super.key});

  @override
  ValorantInfoAppController get controller =>
      Get.put(ValorantInfoAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class ValorantInfoAppController extends GetxController {
  ValorantInfoAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
