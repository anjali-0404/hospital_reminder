import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/dashboard_screen.dart';

class HospitalCareApp extends StatelessWidget {
  const HospitalCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HospitalCare',
      theme: appTheme,
      home: const DashboardScreen(),
    );
  }
}
