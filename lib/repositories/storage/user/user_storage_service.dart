import 'package:mvvm/repositories/storage/entities/storage_user.dart';

abstract class UserStorageService {
  Future<bool> saveToken(String token);
  Future removeAll();
  Future<String?> getToken();
  saveProfile(StorageUser user);
  StorageUser? getProfile();
}