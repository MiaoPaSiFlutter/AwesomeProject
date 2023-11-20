import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

import 'attendance_app.dart';

class MuetAttendanceTakingApp
    extends GetView<MuetAttendanceTakingAppController> {
  const MuetAttendanceTakingApp({super.key});

  @override
  MuetAttendanceTakingAppController get controller =>
      Get.put(MuetAttendanceTakingAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MuetAttendanceTakingAppController extends GetxController {
  MuetAttendanceTakingAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
