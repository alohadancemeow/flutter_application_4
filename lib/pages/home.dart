import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/my_custom_form.dart';
import 'package:flutter_application_4/pages/student_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final studentIdController = TextEditingController();
  final emailController = TextEditingController();

  // Clean up the controller
  @override
  void dispose() {
    usernameController.dispose();
    studentIdController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Form Demo')),
      ),
      body: MyCustomForm(
        formKey: _formKey,
        usernameController: usernameController,
        studentIdController: studentIdController,
        emailController: emailController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentInfo(
                  name: usernameController.text,
                  studentId: int.parse(studentIdController.text),
                  email: emailController.text,
                ),
              ),
            );
          }
        },
        tooltip: 'Submit',
        child: const Icon(Icons.send),
      ),
    );
  }
}
