import 'package:flutter/material.dart';

import '../routers/routers_index.dart';
import '../tools/tools_index.dart';
import 'dashboard/dashboard_screen.dart';

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
          primaryColor: AppColors.primaryColor1,
          useMaterial3: true,
          fontFamily: "Poppins"),
      home: const DashboardScreen(),
    );
  }
}
