import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable : false)
class User {
  final String uid;
  final String name;
  final String firstname;
  final String email;
  final String userRole;

  User({this.uid, this.name, this.firstname, this.email, this.userRole});


  User.fromJson(Map<String, dynamic> data):
        uid = data['uid'],
        name = data['name'],
        firstname = data['firstname'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() =>
      {
        'uid' : uid,
        'name': name,
        'firstname': firstname,
        'email': email,
        'userRole': userRole,
      };
}