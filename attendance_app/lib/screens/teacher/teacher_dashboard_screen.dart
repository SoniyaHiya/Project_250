import 'package:flutter/material.dart';
import 'start_attendance_screen.dart';
import '../../services/ble_service.dart';
import 'package:flutter/material.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bleService = BleService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const StartAttendanceScreen(),
    ),
  );
},
              child: const Text("Start Attendance"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
           onPressed: () {},              child: const Text("Attendance Report"),
            ),

            const SizedBox(height: 20),

           ElevatedButton(
  onPressed: () async {
    bool isOn = await bleService.isBluetoothOn();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isOn ? "Bluetooth is ON" : "Bluetooth is OFF",
        ),
      ),
    );
  },
  child: const Text("Check Bluetooth"),
),
          ],
        ),
      ),
    );
  }
}