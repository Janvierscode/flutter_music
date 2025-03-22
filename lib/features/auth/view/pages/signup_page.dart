import 'package:flutter/material.dart';
import 'package:flutter_music/core/common/toast.dart';
import 'package:flutter_music/core/theme/app_pallete.dart';
import 'package:flutter_music/features/auth/model/user_model.dart';
import 'package:flutter_music/features/auth/repository/auth_remote_repository.dart';
import 'package:flutter_music/features/auth/view/pages/signin_page.dart';
import 'package:flutter_music/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:flutter_music/features/auth/view/widgets/form_field.dart';
import 'package:fpdart/fpdart.dart' show Left, Right;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });
    // print("Name: ${_nameController.text}");
    // print("Email: ${_emailController.text}");
    // print("Password: ${_passwordController.text}");
    if (_formKey.currentState!.validate()) {
      final res = await AuthRemoteRepository().signUp(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('respose✅✅ :$res');
      final val = switch (res) {
        Left(value: final l) => l,
        Right(value: final r) => r,
      };
      if (res is Left) {
        showToast(message: '$val');
      } else if (res is Right) {
        final user = val as UserModel;
        showToast(message: 'Welcome, ${user.name}');
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.kBackgroundColor,
      appBar: AppBar(backgroundColor: Pallete.kBackgroundColor),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  'Sign Up.',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        CustomField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 15),

                        CustomField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 15),

                        CustomField(
                          controller: _passwordController,
                          hintText: 'Password',
                          isObscureText: true,
                        ),
                        const SizedBox(height: 20),
                        AuthGradientButton(
                          onTap: _submit,
                          widget:
                              _isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignInPage();
                                },
                              ),
                            );
                          },
                          child: RichText(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
