import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/dialog_service.dart';
import 'package:flutter_app/services/firestore_service.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../services/authentification_service.dart';
import '../../services/navigation_service.dart';

final signUpViewModelProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  return SignUpViewModel(
      ref.read(authentificationServiceProvider),
      ref.read(dialogServiceProvider),
      ref.read(navigationServiceProvider),
      ref.read(firestoreProvider)
  );
});



class SignUpViewModel extends ChangeNotifier {
  final AuthentificationService _auth;
  final DialogService _alertDialogService;
  final NavigationService _navigationService;
  final FirestoreService _firestoreService;

  SignUpViewModel(this._auth, this._alertDialogService, this._navigationService, this._firestoreService, [this._selectedRole = 'Are you a migrant or an helper']);


  List<String> roles = ['Helper', 'Migrant'];


  String _selectedRole;
  String get selectedRole => _selectedRole;
  
  void setSelectedRole(selectedRole) {
    _selectedRole = selectedRole;
    notifyListeners();
  }
  // Authentification
  Future signUp({@required String email, @required String password, @required String name, @required String firstname, @required String userRole}) async {
    await _auth.signUp(email: email, password: password);
    var currentUserId = _auth.currentUser.uid;
    try {
      User user = User(
        uid: currentUserId,
        email: email,
        name: name,
        firstname: firstname,
        userRole: userRole.toLowerCase(),
      );
      print(user.toJson());
      await _firestoreService.addUser(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  void navigateToSignIn() {
    _navigationService.navigateTo('/');
  }
}
