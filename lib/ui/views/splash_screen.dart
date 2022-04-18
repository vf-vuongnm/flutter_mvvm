import 'package:mvvm/business_logic/view_models/splash_screen_view_model.dart';
import 'package:mvvm/ui/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: _SplashScreenBody()
    );
  }
}

class _SplashScreenBody extends StatefulWidget {
  const _SplashScreenBody({Key? key}) : super(key: key);

  @override
  __SplashScreenBodyState createState() {
    return __SplashScreenBodyState();
  }
}

class __SplashScreenBodyState extends State<_SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<SplashScreenViewModel>().isAuth().then((isAuth) => {
      if(isAuth) {
        AutoRouter.of(context).replace(const HomeScreen())
      } else {
        AutoRouter.of(context).replace(const LoginScreen())
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${"loading".tr()}..."),
    );
  }
}