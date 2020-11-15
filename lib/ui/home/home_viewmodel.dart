import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/app/router.gr.dart';
import 'package:flutter_app/services/authentification_service.dart';
import 'package:flutter_app/services/navigation_service.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel(
    ref.read(authentificationServiceProvider),
    ref.read(navigationServiceProvider),
  );
});

class HomeViewModel extends ChangeNotifier{
  final AuthentificationService _auth;
  final NavigationService _navigationService;

  HomeViewModel(this._auth, this._navigationService);

  User getCurrentUser(){
    return _auth.currentUser;
  }

  void signOut(){
    _auth.signOut();
    _navigationService.navigateTo(Routes.signInView);
  }
}