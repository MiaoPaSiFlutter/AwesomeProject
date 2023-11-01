import 'package:flutter/material.dart';

import 'screens/welcome/welcome_screen.dart';
import 'theme.dart';

class ChatMessageAppUI extends StatelessWidget {
  const ChatMessageAppUI({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const WelcomeScreen(),
    );
  }
}
