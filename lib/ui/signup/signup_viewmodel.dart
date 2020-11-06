import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/alert_dialog_service.dart';
import 'package:flutter_app/services/authentification_service.dart';
import 'package:hooks_riverpod/all.dart';

final signUpViewModelProvider = Provider<SignUpViewModel>((ref) {
  return SignUpViewModel(
    ref.read(authentificationServiceProvider),
    ref.read(alertDialogProvider)
  );
});

class SignUpViewModel {
  final AuthentificationService _auth;
  final AlertDialogService _alertDialogService;

  SignUpViewModel(this._auth, this._alertDialogService);


  // Authentification
  Future signUp({@required String email, @required String password}) async {
    var resMessage = await _auth.signUp(email: email, password: password);
    // _alertDialogService.showMyDialog(message: resMessage);
  }

  // Navigation
  void navigateToSignIn(){
    ExtendedNavigator.root.push('/');
  }
}