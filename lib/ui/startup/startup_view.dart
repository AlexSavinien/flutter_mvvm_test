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
    var hasUserLoggedIn = model.handleStartUpLogic();
    if(hasUserLoggedIn != null) {
      return HomeView();
    } else {
      return SignInView();
    }
  }
}
