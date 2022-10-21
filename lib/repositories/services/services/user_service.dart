import 'package:mvvm/repositories/services/entities/user.dart';
import 'package:mvvm/repositories/web_api/utils/request_result.dart';
import 'package:mvvm/repositories/storage/entities/storage_user.dart';
import 'package:mvvm/repositories/storage/services/user_storage_service.dart';
import 'package:mvvm/repositories/web_api/entities/api_user.dart';
import 'package:mvvm/repositories/web_api/services/user_web_api_service.dart';

class UserService{
  final UserWebApiService _webApiService = UserWebApiService();
  final UserStorageService _storageService = UserStorageService();

  Future<User?> getProfile() async {
    var currentProfile = await _storageService.getProfile();

    if(currentProfile != null) {
      final user = _userFromStorageUser(currentProfile);
      return user;
    }

    var getProfileResult = await _webApiService.getProfile();

    if(getProfileResult.isSuccess) {
      final apiUser = getProfileResult.data as ApiUser;
      _storageService.saveProfile(_storageUserFromApiUser(apiUser));
      return _userFromApiUser(apiUser);
    }
    return null;
  }

  Future<bool> isAuth() async {
    final token = await _storageService.getToken();
    return token != null;
  }

  Future<RequestResult> login(String username, String password) async {
    final loginResult = await _webApiService.login(username, password);

    if (loginResult.isSuccess) {
      final token = loginResult.data as String;
      _storageService.saveToken(token);
    }

    return loginResult;
  }

  User _userFromApiUser(ApiUser apiUser) {
    return User(apiUser.id, apiUser.email, apiUser.firstName, "${apiUser.lastName ?? ""} (From api)", apiUser.avatar);
  }

  User _userFromStorageUser(StorageUser storageUser) {
    return User(storageUser.id, storageUser.email, storageUser.firstName, "${storageUser.lastName ?? ""} (From storage)", storageUser.avatar);
  }

  StorageUser _storageUserFromApiUser(ApiUser apiUser) {
    return StorageUser(apiUser.id ?? 0, apiUser.email, apiUser.firstName, apiUser.lastName, apiUser.avatar);
  }

  Future logout() {
    return _storageService.removeAll();
  }
}