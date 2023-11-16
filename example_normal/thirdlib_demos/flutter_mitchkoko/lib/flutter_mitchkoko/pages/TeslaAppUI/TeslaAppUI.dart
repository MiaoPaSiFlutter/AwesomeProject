import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'screens/screens.dart';
import 'util/price_tracker.dart';

class TeslaAppUI extends StatelessWidget {
  const TeslaAppUI({Key? key}) : super(key: key);

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
