import 'package:mvvm/repositories/services/entities/user.dart';
import 'package:mvvm/repositories/web_api/utils/request_result.dart';
import 'package:mvvm/repositories/service_locator.dart';
import 'package:mvvm/repositories/services/user/user_service.dart';
import 'package:mvvm/repositories/storage/entities/storage_user.dart';
import 'package:mvvm/repositories/storage/user/user_storage_service.dart';
import 'package:mvvm/repositories/web_api/entities/api_user.dart';
import 'package:mvvm/repositories/web_api/user/user_web_api.dart';

class UserServiceImpl implements UserService {
  final UserWebApi _webApi = serviceLocator<UserWebApi>();
  final UserStorageService _storageService = serviceLocator<UserStorageService>();

  @override
  Future<User?> getProfile() async {
    var currentProfile = _storageService.getProfile();
    if(currentProfile != null) {
      final user = _userFromStorageUser(currentProfile);
      return user;
    }

    var getProfileResult = await _webApi.getProfile();

    if(getProfileResult.isSuccess) {
      final apiUser = getProfileResult.data as ApiUser;
      _storageService.saveProfile(_storageUserFromApiUser(apiUser));
      return _userFromApiUser(apiUser);
    }
    return null;
  }

  @override
  Future<bool> isAuth() async {
    final token = await _storageService.getToken();
    return token != null;
  }

  @override
  Future<RequestResult> login(String username, String password) async {
    final loginResult = await _webApi.login(username, password);

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
    var storageUser = StorageUser(apiUser.id ?? 0);
    storageUser.email = apiUser.email;
    storageUser.firstName = apiUser.firstName;
    storageUser.lastName = apiUser.lastName;
    storageUser.avatar = apiUser.avatar;
    return storageUser;
  }

  @override
  Future logout() {
    return _storageService.removeAll();
  }
}