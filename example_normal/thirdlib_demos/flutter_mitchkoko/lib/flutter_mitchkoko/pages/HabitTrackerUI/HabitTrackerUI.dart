import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';

void main() async {
  runApp(const HabitTrackerUI());
}

class HabitTrackerUI extends StatefulWidget {
  const HabitTrackerUI({super.key});

  @override
  State<HabitTrackerUI> createState() => _HabitTrackerUIState();
}

class _HabitTrackerUIState extends State<HabitTrackerUI> {
  bool _isInitializeApp = false;
  @override
  void initState() {
    super.initState();

    initializeApp();
  }

  Future<void> initializeApp() async {
    // initialize hive
    await Hive.initFlutter();

    // open a box
    await Hive.openBox("Habit_Database");
    setState(() {
      _isInitializeApp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isInitializeApp
          ? const HomePage()
          : const Center(
              child: CircularProgressIndicator(),
            ),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
