import 'package:flutter/material.dart';
import 'package:flutter_music/core/common/toast.dart';
import 'package:flutter_music/core/theme/app_pallete.dart';
import 'package:flutter_music/features/auth/model/user_model.dart';
import 'package:flutter_music/features/auth/repository/auth_remote_repository.dart';
import 'package:flutter_music/features/auth/view/pages/signup_page.dart';
import 'package:flutter_music/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:flutter_music/features/auth/view/widgets/form_field.dart';
import 'package:fpdart/fpdart.dart' show Left, Right;

import '../../repository/auth_repository.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      final res = await AuthRemoteRepository().signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final val = switch (res) {
        Left(value: final l) => l,
        Right(value: final r) => r,
      };
      if (res is Left) {
        showToast(message: '$val');
      } else if (res is Right) {
        showToast(message: 'You Logged in Successfully✅');
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
                  'Sign In.',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

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
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AuthGradientButton(
                  onTap: _submit,
                  widget:
                      _isLoading
                          ? CircularProgressIndicator()
                          : Text(
                            'Sign In',
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
                          return SignupPage();
                        },
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.titleMedium,
                      text: 'Do\'t have an account. ',
                      children: [
                        TextSpan(
                          style: TextStyle(color: Pallete.kGradient2),
                          text: 'Sign Up',
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
