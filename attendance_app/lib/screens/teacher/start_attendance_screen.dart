import 'package:flutter/material.dart';
import '../../models/session_model.dart';
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

            TextField(
      controller: courseController,
              decoration: const InputDecoration(
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

           TextField(
               controller: roomController,
              decoration: const InputDecoration(
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
                  String sessionId =
    "${courseController.text}-${DateTime.now().millisecondsSinceEpoch}";

SessionModel session = SessionModel(
  sessionId: sessionId,
  courseCode: courseController.text,
  roomNumber: roomController.text,
  startTime: DateTime.now(),
  isActive: true,
);
                  print("Session ID: ${session.sessionId}");
                  print("Course: ${session.courseCode}");
                  print("Room: ${session.roomNumber}");
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