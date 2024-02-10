import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  final String name;
  final int studentId;
  final String email;

  const StudentInfo({
    super.key,
    required this.name,
    required this.studentId,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Info')),
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              children: [Text('Student name : $name')],
            ),
            Row(
              children: [Text('Student ID : $studentId')],
            ),
            Row(
              children: [Text('Student enail : $email')],
            ),
          ],
        ),
      ),
    );
  }
}
