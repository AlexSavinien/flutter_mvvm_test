import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/all.dart';

final SignInViewModelProvider = Provider<SignInViewModel>((ref) {
  return SignInViewModel();
});

class SignInViewModel {
  void navigateToSignUp(){
    ExtendedNavigator.root.push('/sign-up-view');
  }
}