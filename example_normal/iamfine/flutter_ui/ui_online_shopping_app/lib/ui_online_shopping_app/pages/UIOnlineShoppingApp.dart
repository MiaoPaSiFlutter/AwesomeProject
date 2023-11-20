import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'screens/tabbar/tabbar.dart';
import 'utils/utils_index.dart';


class UIOnlineShoppingApp extends GetView<UIOnlineShoppingAppController> {
  const UIOnlineShoppingApp({super.key});

  @override
  UIOnlineShoppingAppController get controller => Get.put(UIOnlineShoppingAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class UIOnlineShoppingAppController extends GetxController {
  UIOnlineShoppingAppController();

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
      title: 'Fresh-Buyer',
      theme: appTheme(),
      routes: routes,
      home: const FRTabbarScreen(),
    );
  }
}
