import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';

final authentificationServiceProvider = Provider<AuthentificationService>((ref) {
  return AuthentificationService();
});

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  isUserLoggedIn() {
    var isUserLoggedIn = _auth.authStateChanges().listen((User user) {
      return user != null;
    });
    return isUserLoggedIn;
  }

  Future<String> signUp({@required String email, @required String password}) async {
    try {
      var res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(res.user != null) {
       return 'User have signed up';
      } else {
        return 'Unable to sign you up, please try later';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signIn({@required String email, @required String password}) async {
    try {
      var res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(res.user != null) {
        return 'User have logged in';
      } else {
        return 'Unable to log you in, please try later';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  }



}