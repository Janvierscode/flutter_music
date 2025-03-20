import 'package:flutter/material.dart';
import 'package:flutter_music/core/theme/app_pallete.dart';
import 'package:flutter_music/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:flutter_music/features/home/view/widgets/form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.kBackgroundColor,
      appBar: AppBar(backgroundColor: Pallete.kBackgroundColor),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
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
                      CustomField(controller: _nameController, label: 'Name'),
                      const SizedBox(height: 15),

                      CustomField(controller: _emailController, label: 'Email'),
                      const SizedBox(height: 15),

                      CustomField(
                        controller: _passwordController,
                        label: 'Password',
                      ),
                      const SizedBox(height: 20),
                      AuthGradientButton(),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.titleMedium,
                          text: 'Already have an account? ',
                          children: [
                            TextSpan(
                              style: TextStyle(
                                color: Pallete.kGradient2,
                                fontWeight: FontWeight.bold,
                              ),
                              text: 'Sign In',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
