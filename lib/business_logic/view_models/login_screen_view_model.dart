import 'dart:async';

import 'package:mvvm/repositories/service_locator.dart';
import 'package:mvvm/repositories/services/user/user_service.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel with ChangeNotifier {
  final UserService _userService = serviceLocator<UserService>();

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool _isLoginRequesting = false;
  bool get isLoginRequesting => _isLoginRequesting;
  set isLoginRequesting(bool value) {
    _isLoginRequesting = value;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    if(username.isEmpty || password.isEmpty) {
      errorMessage = 'Username or password is empty';
      return false;
    }

    isLoginRequesting = true;
    errorMessage = '';
    final loginResult = await _userService.login(username, password);
    if(!loginResult.isSuccess) {
      errorMessage = loginResult.message;
    }
    isLoginRequesting = false;
    return loginResult.isSuccess;
  }
}