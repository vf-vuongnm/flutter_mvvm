import 'dart:async';

import 'package:mvvm/repositories/services/user/user_service.dart';
import 'package:flutter/material.dart';

class SplashScreenViewModel with ChangeNotifier {
  final UserService _userService = UserService();

  Future<bool> isAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    return _userService.isAuth();
  }
}