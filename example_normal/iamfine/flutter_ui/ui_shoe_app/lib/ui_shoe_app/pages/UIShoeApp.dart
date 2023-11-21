import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'route_generator.dart';
import 'screens/splash_screen.dart';

class UIShoeApp extends GetView<UIShoeAppController> {
  const UIShoeApp({super.key});

  @override
  UIShoeAppController get controller => Get.put(UIShoeAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIShoeAppController extends GetxController {
  UIShoeAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Isaatech Ecommerce',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        fontFamily: 'Gilroy',
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF0F1327),
          secondary: Color(0xFFEFC3FE),
          onPrimary: Colors.white,
          surface: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black87,
          background: Colors.white,
          error: Colors.red,
          onBackground: Colors.black87,
          onError: Colors.white,
        ),
      ),
      initialRoute: SplashScreen.id,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
