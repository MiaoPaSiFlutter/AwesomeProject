import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../constant/constant_index.dart';
import 'welcome_page.dart';

class MarketkyApp extends GetView<MarketkyAppController> {
  const MarketkyApp({super.key});

  @override
  MarketkyAppController get controller => Get.put(MarketkyAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MarketkyAppController extends GetxController {
  MarketkyAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito',
      ),
      home: const WelcomePage(),
    );
  }
}
