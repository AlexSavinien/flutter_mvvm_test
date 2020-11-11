import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home/home_view.dart';
import 'package:flutter_app/ui/signin/signin_view.dart';
import 'package:flutter_app/ui/startup/startup_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class StartUpView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read(startUpViewModelProvider);
    return StreamBuilder(
      stream: model.onAuthChanged,
      builder: (context, AsyncSnapshot<User> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final bool isUserLoggedIn = snapshot.hasData;
          return isUserLoggedIn ? HomeView() : SignInView();
        }
        return Container(
          color: Colors.white,
          child: CircularProgressIndicator(),
        );
    },
    );
    // var hasUserLoggedIn = model.handleStartUpLogic();
    // if(hasUserLoggedIn) {
    //   print('User is already logged in');
    //   return HomeView();
    // } else {
    //   print('no user currently logged in');
    //   return SignInView();
    // }
  }
}
