import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'screens/onboding/onboding_screen.dart';
class UIAnimatedRiveApp extends GetView<UIAnimatedRiveAppController> {
  const UIAnimatedRiveApp({super.key});

  @override
  UIAnimatedRiveAppController get controller => Get.put(UIAnimatedRiveAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIAnimatedRiveAppController extends GetxController {
  UIAnimatedRiveAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      home: const OnbodingScreen(),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
