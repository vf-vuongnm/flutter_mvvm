import 'package:mvvm/ui/views/home_screen.dart';
import 'package:mvvm/ui/views/login_screen.dart';
import 'package:mvvm/ui/views/profile_screen.dart';
import 'package:mvvm/ui/views/splash_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen),
    CustomRoute(page: HomeScreen, transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: ProfileScreen, transitionsBuilder: TransitionsBuilders.slideLeft),
  ],
)
class $AppRouter {}