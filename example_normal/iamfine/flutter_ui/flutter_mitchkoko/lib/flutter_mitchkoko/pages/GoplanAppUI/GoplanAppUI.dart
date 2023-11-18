// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'pages/splash_screen.dart';

class GoplanAppUI extends StatelessWidget {
  final Color _primaryColor = getColorFromHex('#DC54FE');
  final Color _accentColor = getColorFromHex('#5AD3BC');

  GoplanAppUI({super.key});

  // Design color
  // Color _primaryColor= getColorFromHex('#FFC867');
  // Color _accentColor= getColorFromHex('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= getColorFromHex('#D44CF6');
  // Color _accentColor= getColorFromHex('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= getColorFromHex('#651BD2');
  //Color _accentColor= getColorFromHex('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: _accentColor),
      ),
      home: SplashScreen(title: 'Go Plan'),
    );
  }
}
