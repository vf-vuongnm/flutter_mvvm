import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repositories/storage/database/database.dart';
import 'package:mvvm/repositories/storage/entities/storage_user.dart';
import 'package:mvvm/shared/extensions.dart';

class UserStorageService {
  Future<AppDatabase> getDatabase() {
    return $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  Future<String?> getToken() async {
    return secureStorage.read(key: "token");
  }

  Future<bool> saveToken(String token) async {
    await secureStorage.write(key: "token", value: token);
    return true;
  }

  Future removeAll() async {
    await secureStorage.delete(key: "token");

    var database = await getDatabase();
    await database.clearAllTables();
    return true;
  }

  Future<StorageUser?> getProfile() async {
    var database = await getDatabase();
    var users = await database.storageDao.findAllUsers();
    await database.close();
    return users.firstOrNull;
  }

  saveProfile(StorageUser user) async {
    var database = await getDatabase();
    await database.storageDao.insertUser(user);
    await database.close();
  }
}