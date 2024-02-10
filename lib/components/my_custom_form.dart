import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  final Key formKey;
  final TextEditingController usernameController;
  final TextEditingController studentIdController;
  final TextEditingController emailController;

  const MyCustomForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.studentIdController,
    required this.emailController,
  });

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // email format
  RegExp validEmail = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                autofocus: true,
                controller: widget.usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'student name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: widget.studentIdController,
                decoration: const InputDecoration(
                  labelText: 'Student ID',
                  hintText: '66xxxxxxxxx',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (double.tryParse(value) == null) {
                    return 'ID must be number';
                  } else if (value.length != 11) {
                    return 'Student ID is 11';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: widget.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'student@email.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!validEmail.hasMatch(value)) {
                    return 'Email invalid';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
