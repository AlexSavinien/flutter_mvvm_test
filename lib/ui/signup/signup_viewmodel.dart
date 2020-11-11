import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/dialog_service.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../services/authentification_service.dart';
import '../../services/navigation_service.dart';

final signUpViewModelProvider = Provider<SignUpViewModel>((ref) {
  return SignUpViewModel(
      ref.read(authentificationServiceProvider),
      ref.read(dialogServiceProvider),
      ref.read(navigationServiceProvider),
  );
});

class SignUpViewModel {
  final AuthentificationService _auth;
  final DialogService _alertDialogService;
  final NavigationService _navigationService;

  SignUpViewModel(
      this._auth, this._alertDialogService, this._navigationService);

  // Authentification
  Future signUp({@required String email, @required String password}) async {
    await _auth.signUp(email: email, password: password);
  }

  // Navigation
  void navigateToSignIn() {
    _navigationService.navigateTo('/');
  }
}
