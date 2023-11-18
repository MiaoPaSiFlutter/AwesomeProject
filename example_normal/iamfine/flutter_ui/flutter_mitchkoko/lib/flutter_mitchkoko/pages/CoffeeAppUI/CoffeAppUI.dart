import 'package:flutter/material.dart';

import 'config/services_locator.dart';
import 'home.page.dart';

class CoffeAppUI extends StatefulWidget {
  const CoffeAppUI({super.key});

  @override
  State<CoffeAppUI> createState() => _CoffeAppUIState();
}

class _CoffeAppUIState extends State<CoffeAppUI> {
  // This widget is the root of your application.
  @override
  void initState() {
    initServicesLocator();
    super.initState();
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.of(context).pop();
    // });
  }

  @override
  void dispose() {
    disposeServicesLocator();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("IZR / Flutter App Challenge - Coffee App (Flutter 3.7.1)");
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
