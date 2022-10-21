import 'package:mvvm/repositories/web_api/utils/request_result.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repositories/web_api/utils/rest_error.dart';
import 'package:dio/dio.dart';

class UserWebApiService{
  Future<RequestResult> login(String username, String password) async {
    final Map<String, String> loginBody = {
      'username': username,
      'password': password
    };

    final result = await restClient.login(loginBody).then((response) {
      final token = response.token;
      if (token == null) {
        return RequestResult.error("Token is not found");
      }
      return RequestResult.success(token);
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          final error = RestError.fromJson(res?.data);
          return RequestResult.error(error.error ?? "");
        default:
          return RequestResult.error("Unknown error");
      }
    });

    return result;
  }

  Future<RequestResult> getProfile() async {
    final result = await restClient.getProfile(4).then((apiUser) {
      return RequestResult.success(apiUser);
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          final error = RestError.fromJson(res?.data);
          return RequestResult.error(error.error ?? "");
        default:
          return RequestResult.error("Unknown error");
      }
    });
    return result;
  }
}