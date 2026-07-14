import 'package:flutter/material.dart';
import 'teacher_dashboard_screen.dart';

class TeacherLoginScreen extends StatelessWidget {
  const TeacherLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.person,
              size: 90,
            ),

            const SizedBox(height: 25),

            TextField(
              decoration: const InputDecoration(
                labelText: "Teacher Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
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
      builder: (context) => const TeacherDashboardScreen(),
    ),
  );
},
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}