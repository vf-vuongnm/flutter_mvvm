import 'package:easy_localization/easy_localization.dart';
import 'package:mvvm/business_logic/view_models/login_screen_view_model.dart';
import 'package:mvvm/business_logic/view_models/profile_screen_view_model.dart';
import 'package:mvvm/global/app_theme.dart';
import 'package:mvvm/repositories/service_locator.dart';
import 'package:mvvm/repositories/web_api/utils/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'business_logic/view_models/splash_screen_view_model.dart';
import 'ui/router/app_router.gr.dart';
import 'package:dio/dio.dart';

final logger = Logger();
final restClient = RestClient(Dio());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenViewModel()),
        ChangeNotifierProvider(create: (_) => LoginScreenViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileScreenViewModel()),
      ],
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ja')],
          path: 'assets/translations',
          useOnlyLangCode: true,
          fallbackLocale: const Locale('en'),
          child: MyApp()
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.light(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser()
    );
  }
}
