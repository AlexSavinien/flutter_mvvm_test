import 'package:flutter/material.dart';
import 'package:flutter_app/ui/signin/signin_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../style_constants.dart';

class SignInView extends HookWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = context.read(signInViewModelProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
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
              onPressed: () {},
              child: Text('Log In'),
            ),
            GestureDetector(
              onTap: () {
                model.navigateToSignUp();
                print('tapped');
              },
              child: Text('No account yet ? Click and sign up !'),
            )
          ],
        ),
      ),
    );
  }
}
