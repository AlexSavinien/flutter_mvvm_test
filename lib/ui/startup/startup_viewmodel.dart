import 'package:flutter_app/app/router.gr.dart';
import 'package:flutter_app/services/authentification_service.dart';
import 'package:flutter_app/services/navigation_service.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final startUpViewModelProvider = Provider<StartUpViewModel>((ref) {
  return StartUpViewModel(
    ref.read(authentificationServiceProvider),
    ref.read(navigationServiceProvider),
  );
});

class StartUpViewModel {
  final AuthentificationService _auth;
  final NavigationService _navigationService;

  StartUpViewModel(this._auth, this._navigationService);
  
  void navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }

  handleStartUpLogic() {
    var isUserLoggedIn = _auth.isUserLoggedIn();
    return isUserLoggedIn;
  }

}