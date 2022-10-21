import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/repositories/services/services/global_service.dart';

class GlobalViewModel with ChangeNotifier {
  final _globalService = GlobalService();

  String _currentLanguage = "en";
  String get currentLanguage => _currentLanguage;
  set currentLanguage(String value) {
    _currentLanguage = value;
    notifyListeners();
  }

  GlobalViewModel() {
    _setup();
  }

  _setup() {
    _syncLanguage();
  }

  _syncLanguage() async {
    var storageLanguage = await _globalService.getLanguage();
    if(storageLanguage != null) {
      currentLanguage = storageLanguage;
    }
  }

  saveLanguage(String language) {
    _globalService.saveLanguage(language);
    currentLanguage = language;
  }
}