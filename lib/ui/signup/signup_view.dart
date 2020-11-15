import 'package:flutter/material.dart';
import 'package:flutter_app/ui/signup/signup_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../style_constants.dart';

class SignUpView extends HookWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final firstnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = context.read(signUpViewModelProvider);
    print('prout');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: firstnameController,
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter your firstname'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter your lastname'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer(
                    builder: (context, watch, child) {
                      var selectedRole = watch(signUpViewModelProvider).selectedRole;
                      // print(selectedRole);
                      return Text(selectedRole);
                    },
                  ),
                  DropdownButton(
                    icon: Icon(Icons.arrow_downward),
                    items: model.roles.map<DropdownMenuItem>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      model.setSelectedRole(newValue);
                      // print(model.selectedRole);
                    },
                  ),
                ],
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
                      password: passwordController.text,
                      name: nameController.text,
                      firstname: firstnameController.text,
                      userRole: model.selectedRole,
                  );
                },
                child: Text('Sign Up'),
              ),
              GestureDetector(
                onTap: () {
                  model.navigateToSignIn();
                  print('tapped');
                },
                child: Text('Already an account ? Click here and sign in !'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
