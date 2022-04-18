import 'package:mvvm/repositories/storage/entities/storage_user.dart';
import 'package:mvvm/repositories/storage/user/user_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:realm/realm.dart';

const secureStorage = FlutterSecureStorage();

class UserStorageServiceImpl implements UserStorageService {
  final realm = Realm(Configuration([StorageUser.schema]));

  @override
  Future<String?> getToken() async {
    return secureStorage.read(key: "token");
  }

  @override
  Future<bool> saveToken(String token) async {
    await secureStorage.write(key: "token", value: token);
    return true;
  }

  @override
  Future removeAll() async {
    await secureStorage.delete(key: "token");
    realm.write(() {
      realm.deleteMany(realm.all<StorageUser>());
    });
    return true;
  }

  @override
  StorageUser? getProfile() {
    final users =  realm.all<StorageUser>();

    if (users.isEmpty) {
      return null;
    }
    final user = users.first;
    return user;
  }

  @override
  saveProfile(StorageUser user) {
    realm.write(() {
      realm.add(user);
    });
  }
}