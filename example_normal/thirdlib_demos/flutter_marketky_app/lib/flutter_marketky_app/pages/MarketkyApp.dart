import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/constant_index.dart';
import 'welcome_page.dart';

class MarketkyApp extends StatefulWidget {
  @override
  State<MarketkyApp> createState() => _MarketkyAppState();
}

class _MarketkyAppState extends State<MarketkyApp> {
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
