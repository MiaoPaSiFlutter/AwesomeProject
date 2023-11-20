import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'routes/router.gr.dart';
import 'theme.dart';

class UIFoodybiteApp extends GetView<UIFoodybiteAppController> {
  const UIFoodybiteApp({super.key});

  @override
  UIFoodybiteAppController get controller =>
      Get.put(UIFoodybiteAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIFoodybiteAppController extends GetxController {
  UIFoodybiteAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(context),
    );
  }
}
