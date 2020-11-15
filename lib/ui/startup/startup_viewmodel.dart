import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.gr.dart';
import 'package:flutter_app/services/authentification_service.dart';
import 'package:flutter_app/services/navigation_service.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final startUpViewModelProvider = ChangeNotifierProvider<StartUpViewModel>((ref) {
  return StartUpViewModel(
    ref.read(authentificationServiceProvider),
    ref.read(navigationServiceProvider),
  );
});

class StartUpViewModel extends ChangeNotifier {
  final AuthentificationService _auth;
  final NavigationService _navigationService;

  StartUpViewModel(this._auth, this._navigationService);

  Stream<User> get onAuthChanged => _auth.onAuthStateChanged;
  
  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }


}