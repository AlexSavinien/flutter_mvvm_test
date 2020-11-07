import 'package:flutter/material.dart';
import 'package:flutter_app/ui/signup/signup_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../style_constants.dart';

class SignUpView extends HookWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = context.read(signUpViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await model.signUp(
                    email: emailController.text,
                    password: passwordController.text);
              },
              child: Text('Sign Up'),
            ),
            GestureDetector(
              onTap: () {
                model.navigateToSignIn();
                print('tapped');
              },
              child: Text('Already on account ? Click and sign in !'),
            )
          ],
        ),
      ),
    );
  }
}
