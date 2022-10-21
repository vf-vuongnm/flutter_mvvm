import 'dart:async';

import 'package:mvvm/repositories/services/services/user_service.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel with ChangeNotifier {
  final UserService _userService = UserService();

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool _readyForLogin = false;
  bool get readyForLogin => _readyForLogin;
  set readyForLogin(bool value) {
    _readyForLogin = value;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    if(username.isEmpty || password.isEmpty) {
      errorMessage = 'Username or password is empty';
      return false;
    }

    errorMessage = '';
    final loginResult = await _userService.login(username, password);
    if(!loginResult.isSuccess) {
      errorMessage = loginResult.message;
    }
    return loginResult.isSuccess;
  }

  onLoginInputsChanged(String username, String password) {
    readyForLogin = username.isNotEmpty && password.isNotEmpty;
  }
}