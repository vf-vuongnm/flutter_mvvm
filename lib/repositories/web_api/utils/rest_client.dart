import 'package:mvvm/defines/env_configs.dart';
import 'package:mvvm/repositories/web_api/entities/api_user.dart';
import 'package:mvvm/repositories/web_api/entities/auth_token.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/login")
  Future<AuthToken> login(@Body() Map<String, String> map);

  @GET("/users/{id}")
  Future<ApiUser> getProfile(@Path() int id);
}
