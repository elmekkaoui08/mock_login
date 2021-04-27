import 'package:flutter/cupertino.dart';

class Users {
  String _username, _email, _password;
  String name, imageUrl;
  bool isOnline, hasStory;

  Users({this.name, this.isOnline, this.imageUrl, this.hasStory});

  String get getPassword => _password;
  String get getEmail => _email;
  String get getUsername => _username;

  void setPassword(String password) {
    this._password = password;
  }

  void setEmail(String email) {
    this._email = email;
  }

  void setUsername(String username) {
    this._username = username;
  }
}
