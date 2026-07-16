import 'package:flutter/material.dart';
import 'start_attendance_screen.dart';

class StartAttendanceScreen extends StatefulWidget {
  const StartAttendanceScreen({super.key});

  @override
  State<StartAttendanceScreen> createState() =>
      _StartAttendanceScreenState();
}

class _StartAttendanceScreenState extends State<StartAttendanceScreen> {
final TextEditingController courseController = TextEditingController();

final TextEditingController roomController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Attendance"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Course",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                hintText: "Enter Course Code",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Room",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const TextField(
              decoration: InputDecoration(
                hintText: "Enter Room Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const StartAttendanceScreen(),
    ),
  );
},
                child: const Text("Start Session"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}