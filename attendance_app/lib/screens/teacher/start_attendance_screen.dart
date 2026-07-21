import 'package:flutter/material.dart';
import '../../models/session_model.dart';
import '../../services/session_service.dart';
import '../../services/ble_service.dart';

class StartAttendanceScreen extends StatefulWidget {
  const StartAttendanceScreen({super.key});

  @override
  State<StartAttendanceScreen> createState() =>
      _StartAttendanceScreenState();
}

class _StartAttendanceScreenState extends State<StartAttendanceScreen> {
  final TextEditingController courseController = TextEditingController();
  final TextEditingController roomController = TextEditingController();

  final SessionService sessionService = SessionService();

  bool bluetoothOn = false;
  bool sessionStarted = false;
  final BleService bleService = BleService();

@override
void initState() {
  super.initState();
  checkBluetooth();
}

Future<void> checkBluetooth() async {
  bool isOn = await bleService.isBluetoothOn();

  setState(() {
    bluetoothOn = isOn;
  });
}
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

            Text(
              bluetoothOn
                  ? "Bluetooth Status: ON"
                  : "Bluetooth Status: OFF",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: bluetoothOn ? Colors.green : Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (courseController.text.trim().isEmpty ||
                      roomController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter Course and Room"),
                      ),
                    );
                    return;
                  }

                  SessionModel session = sessionService.createSession(
                    courseCode: courseController.text,
                    roomNumber: roomController.text,
                  );

                  print("Session ID: ${session.sessionId}");
                  print("Course: ${session.courseCode}");
                  print("Room: ${session.roomNumber}");
                  setState(() {
  sessionStarted = true;
});

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Session Started Successfully"),
                    ),
                  );
                },
                child: const Text("Start Session"),
              ),
            ),
            const SizedBox(height: 20),

if (sessionStarted)
  const Center(
    child: Text(
      "Attendance Session is Running",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    ),
  ),
          ],
        ),
      ),
    );
  }
}