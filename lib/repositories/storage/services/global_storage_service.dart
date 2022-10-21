import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repositories/storage/database/database.dart';
import 'package:mvvm/repositories/storage/entities/storage_user.dart';
import 'package:mvvm/shared/extensions.dart';

class GlobalStorageService {
  Future<String?> getLanguage() async {
    return secureStorage.read(key: "language");
  }

  Future<bool> saveLanguage(String language) async {
    await secureStorage.write(key: "language", value: language);
    return true;
  }
}