import 'package:flutter/material.dart';

import 'app/features/dashboard/views/screens/dashboard_screen.dart';
import 'app/config/themes/app_theme.dart';

class FDManagementUI extends StatelessWidget {
  const FDManagementUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic,
      home: const DashboardScreen(),
    );
  }
}
