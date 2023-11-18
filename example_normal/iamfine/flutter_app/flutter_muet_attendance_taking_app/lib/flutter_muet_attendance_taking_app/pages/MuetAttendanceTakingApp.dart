import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

import 'attendance_app.dart';

class MuetAttendanceTakingApp extends StatefulWidget {
  const MuetAttendanceTakingApp({super.key});

  @override
  State<MuetAttendanceTakingApp> createState() =>
      _MuetAttendanceTakingAppState();
}

class _MuetAttendanceTakingAppState extends State<MuetAttendanceTakingApp> {
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(StudentAdapter(), override: true);
    setState(() {
      _isInit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isInit
        ? const MUETAttendanceApp()
        : const Center(
            child: Text('准备中。。。'),
          );
  }
}
