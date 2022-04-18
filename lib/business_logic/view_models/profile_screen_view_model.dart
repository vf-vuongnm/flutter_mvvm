import 'dart:async';

import 'package:mvvm/business_logic/presentations/user_presentation.dart';
import 'package:mvvm/repositories/service_locator.dart';
import 'package:mvvm/repositories/services/user/user_service.dart';
import 'package:flutter/material.dart';

class ProfileScreenViewModel with ChangeNotifier {
  final UserService _userService = serviceLocator<UserService>();

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  bool _isProfileRequesting = false;
  bool get isProfileRequesting => _isProfileRequesting;
  set isProfileRequesting(bool value) {
    _isProfileRequesting = value;
    notifyListeners();
  }

  UserPresentation? _userPresentation;
  UserPresentation? get userPresentation => _userPresentation;
  set userPresentation(UserPresentation? value) {
    _userPresentation = value;
    notifyListeners();
  }

  Future getProfile() async {
    isProfileRequesting = true;
    errorMessage = '';

    final getProfileResult = await _userService.getProfile();
    isProfileRequesting = false;

    if(getProfileResult == null) {
      errorMessage = "User not found";
      return;
    }

    userPresentation = UserPresentation("${getProfileResult.firstName ?? ""} ${getProfileResult.lastName ?? ""}", getProfileResult.avatar ?? "");
  }

  Future logout() {
    return _userService.logout();
  }
}