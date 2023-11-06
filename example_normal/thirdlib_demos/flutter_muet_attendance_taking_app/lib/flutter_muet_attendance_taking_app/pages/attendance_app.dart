import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_muet_attendance_taking_app/flutter_muet_attendance_taking_app.dart';

import 'screens/attendance_page.dart';
import 'screens/batch_section_input_page.dart';
import 'screens/csv_import_screen.dart';
import 'screens/report_page.dart';
import 'screens/splash_screen.dart';
import 'screens/students_record_page.dart';

class MUETAttendanceApp extends StatelessWidget {
  const MUETAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StudentListProvider>(
            create: (context) => StudentListProvider()),
        ChangeNotifierProvider<UserDataProvider>(
            create: (context) => UserDataProvider()),
      ],
      child: MaterialApp(
        title: 'Attendance App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade900,
            centerTitle: true,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white60, size: 20),
          ),
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          AttendancePage.routeName: (context) => const AttendancePage(),
          ReportPage.routeName: (context) => const ReportPage(),
          StudentsRecordPage.routeName: (context) => const StudentsRecordPage(),
          BatchAndSectionSpecificationScreen.routeName: (context) =>
              const BatchAndSectionSpecificationScreen(),
          CSVDataEntryScreen.routeName: (context) => CSVDataEntryScreen(),
        },
      ),
    );
  }
}
