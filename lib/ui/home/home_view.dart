import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home/home_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.read(homeViewModelProvider);
    var user = model.getCurrentUser();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.signOut();
        },
        child: Text("-"),
      ),
      body: Container(
        child: Center(
          child: Text(user.email),
        ),
      ),
    );
  }
}
