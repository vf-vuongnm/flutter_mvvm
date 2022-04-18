import 'package:mvvm/repositories/web_api/utils/request_result.dart';

abstract class UserWebApi {
  Future<RequestResult> login(String username, String password);
  Future<RequestResult> getProfile();
}