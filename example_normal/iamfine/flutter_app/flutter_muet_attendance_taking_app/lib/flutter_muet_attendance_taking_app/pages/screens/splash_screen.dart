// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

import 'attendance_page.dart';
import 'batch_section_input_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/muet_attendance_taking_app/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
    Future.delayed(const Duration(seconds: 1), () {
      navigate();
    });
  }

  void loadData() async {
    Provider.of<StudentListProvider>(context, listen: false)
        .loadStudentRecord();
  }

  // ignore: avoid_void_async
  void navigate() async {
    if (await PrefsDBService.isFirstRun()) {
      Navigator.pushReplacementNamed(
        context,
        BatchAndSectionSpecificationScreen.routeName,
      );
    } else {
      Navigator.pushReplacementNamed(context, AttendancePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.grey.shade900),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(4, 4),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Utils.assets('images/muet.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'MUET CR 考勤系统\n开发者：Rashid Wassan',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
