import 'package:flutter/material.dart';

import 'globals/globals_index.dart';
import 'routes.dart';
import 'screens/screen_index.dart';

class ECommerceComplateAppUI extends StatelessWidget {
  const ECommerceComplateAppUI({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
