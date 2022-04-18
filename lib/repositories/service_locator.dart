import 'package:mvvm/repositories/services/user/user_service.dart';
import 'package:mvvm/repositories/services/user/user_service_impl.dart';
import 'package:mvvm/repositories/storage/user/user_storage_service.dart';
import 'package:mvvm/repositories/storage/user/user_storage_service_impl.dart';
import 'package:mvvm/repositories/web_api/user/user_web_api.dart';
import 'package:mvvm/repositories/web_api/user/user_web_api_impl.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<UserService>(() => UserServiceImpl());
  serviceLocator.registerLazySingleton<UserStorageService>(() => UserStorageServiceImpl());
  serviceLocator.registerLazySingleton<UserWebApi>(() => UserWebApiImpl());
}
