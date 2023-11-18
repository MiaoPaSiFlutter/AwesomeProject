import 'package:flutter/material.dart';

import 'screens/tabbar/tabbar.dart';
import 'utils/utils_index.dart';

class OnlineShoppingAppUI extends StatelessWidget {
  const OnlineShoppingAppUI({super.key});

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
