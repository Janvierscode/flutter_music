import 'package:flutter/material.dart';
import 'package:flutter_music/core/theme/app_pallete.dart';
import 'package:flutter_music/features/home/view/widgets/form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.kBackgroundColor,
      appBar: AppBar(backgroundColor: Pallete.kBackgroundColor),
      body: Column(
        children: [
          Text(
            'Sign Up.',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CustomField(controller: _textController, label: 'Name'),
                  const SizedBox(height: 15),

                  CustomField(controller: _textController, label: 'Email'),
                  const SizedBox(height: 15),

                  CustomField(controller: _textController, label: 'Password'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
