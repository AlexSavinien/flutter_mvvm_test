import 'package:flutter/foundation.dart';
import 'package:flutter_app/services/authentification_service.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/navigation_service.dart';

final signInViewModelProvider = Provider<SignInViewModel>((ref) {
  return SignInViewModel(
    ref.read(navigationServiceProvider),
    ref.read(authentificationServiceProvider),
  );
});

class SignInViewModel {
  final NavigationService _navigationService;
  final AuthentificationService _auth;

  SignInViewModel(this._navigationService, this._auth);

  void navigateToSignUp() {
    _navigationService.navigateTo('/sign-up-view');
  }

  Future signIn({@required String email, @required String password}) async {
    await _auth.signIn(email: email, password: password);
  }
}
