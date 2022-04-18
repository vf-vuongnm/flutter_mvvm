import 'package:mvvm/repositories/services/entities/user.dart';
import 'package:mvvm/repositories/web_api/utils/request_result.dart';

abstract class UserService {
  Future<RequestResult> login(String username, String password);
  Future logout();
  Future<User?> getProfile();
  Future<bool> isAuth();
}