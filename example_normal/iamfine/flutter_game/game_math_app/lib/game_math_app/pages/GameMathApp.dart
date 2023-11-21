import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'home_page.dart';

class GameMathApp extends GetView<GameMathAppController> {
  const GameMathApp({super.key});

  @override
  GameMathAppController get controller => Get.put(GameMathAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class GameMathAppController extends GetxController {
  GameMathAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
