import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/user_selection/user_selection_screen.dart';

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Offline Attendance System',
  theme: AppTheme.lightTheme,
  home: const UserSelectionScreen(),
);
  }
}