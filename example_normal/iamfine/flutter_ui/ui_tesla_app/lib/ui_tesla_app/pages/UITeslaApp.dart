import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'screens/splash_screen.dart';
import 'util/price_tracker.dart';

class UITeslaApp extends GetView<UITeslaAppController> {
  const UITeslaApp({super.key});

  @override
  UITeslaAppController get controller => Get.put(UITeslaAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UITeslaAppController extends GetxController {
  UITeslaAppController();

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PriceTracker(),
        )
      ],
      child: ScreenUtilInit(
        builder: (ctx, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Gotham Pro'),
          home: const SplashScreen(),
        ),
        designSize: const Size(475, 1082),
      ),
    );
  }
}
