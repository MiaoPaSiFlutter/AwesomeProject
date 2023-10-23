import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class ModernSmartHomeUIApp extends StatelessWidget {
  const ModernSmartHomeUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
