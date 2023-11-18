import 'package:flutter/material.dart';

import 'routing/routing.dart';

class AnimatedTravelAppUI extends StatelessWidget {
  const AnimatedTravelAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAY 3 APP UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Routing(),
    );
  }
}
