import 'package:flutter/material.dart';
import '../tools/tools_index.dart';
import 'table_view.dart';

class PeriodicTableApp extends StatelessWidget {
  const PeriodicTableApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff090C22),
        scaffoldBackgroundColor: kBodyBackgroundColor,
      ),
      title: 'Periodic Table',
      initialRoute: kMainScreenAddress,
      routes: {
        kMainScreenAddress: (context) => const TableView(),
      },
    );
  }
}
