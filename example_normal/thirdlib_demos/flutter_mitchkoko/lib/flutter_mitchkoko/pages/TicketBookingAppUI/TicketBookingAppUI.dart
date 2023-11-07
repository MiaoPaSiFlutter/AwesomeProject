import 'package:flutter/material.dart';
import 'screens/bottom_bar.dart';
import 'utils/utils_index.dart';

class TicketBookingAppUI extends StatelessWidget {
  const TicketBookingAppUI({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const BottomBar(),
    );
  }
}
