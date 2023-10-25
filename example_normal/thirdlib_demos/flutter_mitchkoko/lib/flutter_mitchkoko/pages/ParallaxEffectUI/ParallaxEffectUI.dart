import 'package:flutter/material.dart';

import 'home_page.dart';

class ParallaxEffectUI extends StatelessWidget {
  const ParallaxEffectUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      title: 'Buy Tickets',
      home: const HomePage(),
    );
  }
}
