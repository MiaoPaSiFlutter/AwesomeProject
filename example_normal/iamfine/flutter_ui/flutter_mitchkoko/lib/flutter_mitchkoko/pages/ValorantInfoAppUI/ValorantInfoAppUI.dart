import 'package:flutter/material.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'theme.dart';

class ValorantInfoAppUI extends StatelessWidget {
  const ValorantInfoAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
