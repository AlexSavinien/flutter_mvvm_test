import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/app/router.gr.dart';
import 'package:flutter_app/services/dialog_service.dart';
import 'package:flutter_app/services/navigation_service.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final authentificationServiceProvider = Provider<AuthentificationService>((ref) {
  return AuthentificationService(
    ref.read(dialogServiceProvider),
    ref.read(navigationServiceProvider),
  );
});

class AuthentificationService {
  final DialogService _dialogService;
  final NavigationService _navigationService;

  AuthentificationService(this._dialogService, this._navigationService);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get onAuthStateChanged => _auth.authStateChanges();

  Stream<User> getCurrentUserState() {
    var user = _auth.authStateChanges();
    return user;
  }

  User get currentUser => _auth.currentUser;

  Future signUp({@required String email, @required String password}) async {
    try {
      var res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(res.user != null) {
        _dialogService
            .showDialog(
            title: 'Success',
            description: 'You have correctly sign up')
            .whenComplete(
              () => _navigationService.navigateTo('/'),
        );

        print('User have signed up with this email : $email');
      } else {
        _dialogService.showDialog(
            title: 'Error',
            description: 'Unable to sign you up, please try later',
        );
        print('Error, user can\'t sign up, probably an issue with firebase');
      }
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(
        title: 'Error',
        description: e.message,
      );
    }


  }

  Future signIn({@required String email, @required String password}) async {
    try {
      var res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(res.user != null) {
        _dialogService
            .showDialog(
            title: 'Success',
            description: 'You have correctly sign in')
            .whenComplete(
              () => _navigationService.navigateTo(Routes.homeView),
        );
        print('User have logged in');
      } else {
        print('Unable to log you in, please try later');
      }
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(
        title: 'Error',
        description: e.message,
      );
    }

  }

  Future<void> signOut() async {
    await _auth.signOut();
    print('User has logged out');
  }



}