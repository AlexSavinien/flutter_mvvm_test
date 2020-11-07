import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/navigation_service.dart';

final signInViewModelProvider = Provider<SignInViewModel>((ref) {
  return SignInViewModel(
    ref.read(navigationServiceProvider),
  );
});

class SignInViewModel {
  final NavigationService _navigationService;

  SignInViewModel(this._navigationService);

  void navigateToSignUp() {
    _navigationService.navigateTo('/sign-up-view');
  }
}
