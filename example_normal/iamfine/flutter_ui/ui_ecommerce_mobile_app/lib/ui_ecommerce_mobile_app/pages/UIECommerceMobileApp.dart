import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'constants.dart';
import 'screens/home/home_screen.dart';



class UIECommerceMobileApp extends GetView<UIECommerceMobileAppController> {
  const UIECommerceMobileApp({super.key});

  @override
  UIECommerceMobileAppController get controller => Get.put(UIECommerceMobileAppController());

  @override
  Widget build(BuildContext context) {
    return  MyApp();
  }
}

class UIECommerceMobileAppController extends GetxController {
  UIECommerceMobileAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
