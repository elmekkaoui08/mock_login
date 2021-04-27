import 'package:flutter/material.dart';

class PasswordNotifier with ChangeNotifier {
  bool _visible = true;

  bool get getVisibility => _visible;

  void setVisibility(bool visibilte) {
    _visible = visibilte;
    notifyListeners();
  }
}
